const admin = require("firebase-admin/app");
admin.initializeApp();

const sendScheduledUserAlerts = require("./send_scheduled_user_alerts.js");
exports.sendScheduledUserAlerts =
  sendScheduledUserAlerts.sendScheduledUserAlerts;
const updateCourseAvailability = require("./update_course_availability.js");
exports.updateCourseAvailability =
  updateCourseAvailability.updateCourseAvailability;
