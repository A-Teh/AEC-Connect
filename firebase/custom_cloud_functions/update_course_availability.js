/**
 * AEC Connect - keeps courses.has_available_tutor up to date.
 *
 * A course is available when a tutor has an availability slot right now
 * (today, startTime <= now < endTime) for the course's subject AND the course
 * code is listed in that tutor's `competencies`.
 *
 * Schedule (America/New_York), Mon-Thu:
 *   - every 30 min from 12:00 to 18:30
 *   - one final run at 19:00 (clears the flags once tutoring ends)
 */
const { onSchedule } = require("firebase-functions/v2/scheduler");
const logger = require("firebase-functions/logger");
const admin = require("firebase-admin");
if (!admin.apps.length) admin.initializeApp();
const db = admin.firestore();

const TIME_ZONE = "America/New_York";
const FIELD = "has_available_tutor";
const DAYS = [
  "sunday",
  "monday",
  "tuesday",
  "wednesday",
  "thursday",
  "friday",
  "saturday",
];

const norm = (s) => String(s).trim().toUpperCase();

// "1:00 PM" / "12:30 am" -> minutes since midnight (or null)
function toMinutes(value) {
  if (typeof value !== "string") return null;
  const m = value.match(/^\s*(\d{1,2}):(\d{2})\s*([AaPp][Mm])\s*$/);
  if (!m) return null;
  let hour = parseInt(m[1], 10) % 12;
  const minute = parseInt(m[2], 10);
  if (m[3].toUpperCase() === "PM") hour += 12;
  return hour * 60 + minute;
}

// Current weekday + minutes since midnight in the center's time zone.
function nowInZone() {
  const parts = new Intl.DateTimeFormat("en-US", {
    timeZone: TIME_ZONE,
    weekday: "long",
    hour: "numeric",
    minute: "numeric",
    hourCycle: "h23",
  }).formatToParts(new Date());
  const get = (type) => parts.find((p) => p.type === type).value;
  return {
    day: get("weekday").toLowerCase(),
    minutes: parseInt(get("hour"), 10) * 60 + parseInt(get("minute"), 10),
  };
}

async function updateCourseAvailability() {
  const { day, minutes } = nowInZone();

  const [slotSnap, tutorSnap, courseSnap] = await Promise.all([
    db.collectionGroup("availability").get(),
    db.collection("tutors").get(),
    db.collection("courses").get(),
  ]);

  // course code -> subject
  const subjectOf = new Map();
  courseSnap.forEach((doc) => {
    const d = doc.data();
    if (d.course_code && d.subject) {
      subjectOf.set(norm(d.course_code), norm(d.subject));
    }
  });

  // tutor id -> subjects they are on shift for right now
  const onShift = new Map();
  slotSnap.forEach((doc) => {
    const d = doc.data();
    const tutorId = doc.ref.parent.parent ? doc.ref.parent.parent.id : null;
    const slotDay =
      typeof d.dayOfWeek === "string" ? d.dayOfWeek.trim().toLowerCase() : null;
    const start = toMinutes(d.startTime);
    const end = toMinutes(d.endTime);
    if (
      !tutorId ||
      !d.subject ||
      slotDay !== day ||
      start === null ||
      end === null
    )
      return;
    if (minutes >= start && minutes < end) {
      if (!onShift.has(tutorId)) onShift.set(tutorId, new Set());
      onShift.get(tutorId).add(norm(d.subject));
    }
  });

  // Courses that currently have an available tutor.
  const available = new Set();
  tutorSnap.forEach((doc) => {
    const subjects = onShift.get(doc.id);
    const comps = doc.data().competencies;
    if (!subjects || !Array.isArray(comps)) return;
    comps.forEach((c) => {
      if (typeof c !== "string") return;
      const code = norm(c);
      const subject = subjectOf.get(code);
      if (subject && subjects.has(subject)) available.add(code);
    });
  });

  // Write only documents whose value changed (batches of 400).
  let batch = db.batch();
  let pending = 0;
  let changed = 0;
  const commits = [];
  const stamp = admin.firestore.FieldValue.serverTimestamp();

  for (const doc of courseSnap.docs) {
    const code = norm(doc.data().course_code || "");
    const shouldBe = available.has(code);
    if (doc.data()[FIELD] === shouldBe) continue;

    batch.update(doc.ref, {
      [FIELD]: shouldBe,
      availability_updated_at: stamp,
    });
    pending++;
    changed++;
    if (pending === 400) {
      commits.push(batch.commit());
      batch = db.batch();
      pending = 0;
    }
  }
  if (pending > 0) commits.push(batch.commit());
  await Promise.all(commits);

  logger.info(
    `Availability update (${day} ${Math.floor(minutes / 60)}:${String(minutes % 60).padStart(2, "0")}): ` +
      `${available.size} available of ${courseSnap.size} courses, ${changed} documents changed.`,
  );
}

// Mon-Thu, every 30 min from 12:00 to 19:30 (Eastern).
// The 19:00 / 19:30 runs clear the flags once tutoring ends.
// NOTE: the export name must match the Cloud Function name in FlutterFlow.
exports.updateCourseAvailability = onSchedule(
  { schedule: "0,30 12-19 * * 1-4", timeZone: TIME_ZONE },
  updateCourseAvailability,
);
