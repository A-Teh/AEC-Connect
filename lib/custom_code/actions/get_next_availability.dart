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

Future<String> getNextAvailability(String courseCode) async {
  if (courseCode.trim().isEmpty) {
    return 'Not scheduled';
  }

  const days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  // Convert a time such as "4:30 PM" into minutes after midnight.
  int? parseMinutes(dynamic value) {
    if (value == null) return null;

    final match = RegExp(
      r'^\s*(\d{1,2})(?::(\d{2}))?\s*([AaPp])\.?[Mm]\.?\s*$',
    ).firstMatch(value.toString());

    if (match == null) return null;

    final hour = int.parse(match.group(1)!);
    final minute = int.tryParse(match.group(2) ?? '0') ?? 0;

    if (hour < 1 || hour > 12 || minute > 59) return null;

    final isPm = match.group(3)!.toLowerCase() == 'p';

    return (hour % 12 + (isPm ? 12 : 0)) * 60 + minute;
  }

  // Format minutes after midnight into a readable time.
  String formatTime(int minutes) {
    final hour24 = minutes ~/ 60;
    final minute = minutes % 60;

    final isPm = hour24 >= 12;
    var hour12 = hour24 % 12;

    if (hour12 == 0) hour12 = 12;

    return '$hour12:${minute.toString().padLeft(2, '0')} '
        '${isPm ? 'PM' : 'AM'}';
  }

  try {
    // Find every tutor qualified to teach this course.
    final tutorSnapshot = await FirebaseFirestore.instance
        .collection('tutors')
        .where(
          'competencies',
          arrayContains: courseCode.trim(),
        )
        .get();

    // Store availability times by day of the week.
    final shifts = List.generate(7, (_) => <int>[]);

    // Retrieve each qualified tutor's availability.
    for (final tutor in tutorSnapshot.docs) {
      final availabilitySnapshot =
          await tutor.reference.collection('availability').get();

      for (final slot in availabilitySnapshot.docs) {
        final data = slot.data();

        final dayText = data['dayOfWeek']?.toString().trim().toLowerCase();

        final dayIndex = days.indexWhere(
          (day) => day.toLowerCase() == dayText,
        );

        if (dayIndex < 0) continue;

        final start = parseMinutes(data['startTime']);

        if (start == null) continue;

        shifts[dayIndex].add(start);
      }
    }

    if (shifts.every((day) => day.isEmpty)) {
      return 'Not scheduled';
    }

    final now = DateTime.now();
    final today = now.weekday - 1;
    final nowMinutes = now.hour * 60 + now.minute;

    // Search today first, then the following six days.
    for (var offset = 0; offset < 7; offset++) {
      final dayIndex = (today + offset) % 7;

      final starts = shifts[dayIndex]
          .where((minutes) => offset > 0 || minutes > nowMinutes)
          .toList()
        ..sort();

      if (starts.isEmpty) continue;

      final time = formatTime(starts.first);

      if (offset == 0) return 'Today $time';
      if (offset == 1) return 'Tomorrow $time';

      return '${days[dayIndex]} $time';
    }

    return 'Not scheduled';
  } catch (e) {
    print('getNextAvailable error: $e');
    return 'Error retrieving availability';
  }
}
