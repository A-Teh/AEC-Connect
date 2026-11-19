const { onSchedule } = require("firebase-functions/v2/scheduler");
const admin = require("firebase-admin");
if (!admin.apps.length) admin.initializeApp();

// Runs every 1 minute for testing (change back to "every 30 minutes" for production)
exports.sendScheduledUserAlerts = onSchedule(
  "every 30 minutes",
  async (event) => {
    const now = admin.firestore.Timestamp.now();

    // 1. Find any scheduled notification that is due and hasn't been sent yet
    const snapshot = await admin
      .firestore()
      .collection("scheduled_notifications")
      .where("scheduled_time", "<=", now)
      .where("notification_sent", "==", false)
      .get();

    if (snapshot.empty) return null;

    const batch = admin.firestore().batch();

    for (const doc of snapshot.docs) {
      const data = doc.data();
      const userRef = data.user_ref;
      const courseCode = data.course_code;

      if (userRef) {
        const tokenDocs = await userRef.collection("fcm_tokens").get();
        const tokens = tokenDocs.docs
          .map((d) => d.get("fcm_token"))
          .filter(Boolean);

        if (tokens.length) {
          await admin.messaging().sendEachForMulticast({
            tokens,
            notification: {
              title: `Tutoring Reminder: ${courseCode}`,
              body: `Your scheduled reminder for ${courseCode} is happening now!`,
            },
          });
        }
      }

      // 3. Mark as sent so it doesn't trigger again
      batch.update(doc.ref, { notification_sent: true });
    }

    return batch.commit();
  },
);
