// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> getWorkingTutors(
  String courseCode,
  String? subject,
) async {
  // Schedule subject (e.g. "MTH"); fall back to the course prefix if none given.
  final scheduleSubject = (subject != null && subject.trim().isNotEmpty)
      ? subject.trim()
      : courseCode.trim().split(' ').first;

  const days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final today = days[DateTime.now().weekday - 1];

  final tutors = await FirebaseFirestore.instance
      .collection('tutors')
      .where('competencies', arrayContains: courseCode)
      .get();

  final names = await Future.wait(tutors.docs.map((tutor) async {
    final slots = await tutor.reference
        .collection('availability')
        .where('subject', isEqualTo: scheduleSubject)
        .where('dayOfWeek', isEqualTo: today)
        .get();

    final availability = slots.docs.map((d) => d.data()).toList();
    final working = isTutorWorking(availability, scheduleSubject);
    return working == true ? (tutor.data()['name'] as String?) : null;
  }));

  return names.whereType<String>().where((n) => n.isNotEmpty).toList();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the `</>` button on the right!
