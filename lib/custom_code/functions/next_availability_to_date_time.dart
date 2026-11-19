import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Converts a “next available” label into a DateTime.
///
/// Takes text such as “Today 3:00 PM”, “Tomorrow 4:00 PM” or “Thursday 1:00
/// PM” and returns the matching date and time based on the current clock. A
/// weekday name resolves to its next occurrence. Returns null if the text
/// isn’t a recognizable time, such as “Not scheduled”.
DateTime? nextAvailabilityToDateTime(String label) {
  final match = RegExp(
    r'^\s*(today|tomorrow|monday|tuesday|wednesday|thursday|friday|saturday|sunday)'
    r'\s+(\d{1,2}):(\d{2})\s*([ap])\.?m\.?\s*$',
    caseSensitive: false,
  ).firstMatch(label);

  // "Not scheduled", "Error retrieving availability", etc.
  if (match == null) return null;

  final hour12 = int.parse(match.group(2)!);
  final minute = int.parse(match.group(3)!);
  if (hour12 < 1 || hour12 > 12 || minute > 59) return null;

  final isPm = match.group(4)!.toLowerCase() == 'p';
  final hour24 = hour12 % 12 + (isPm ? 12 : 0);

  const weekdays = {
    'monday': 1,
    'tuesday': 2,
    'wednesday': 3,
    'thursday': 4,
    'friday': 5,
    'saturday': 6,
    'sunday': 7,
  };

  final now = DateTime.now();
  final dayWord = match.group(1)!.toLowerCase();

  int offset;
  var isWeekday = false;
  if (dayWord == 'today') {
    offset = 0;
  } else if (dayWord == 'tomorrow') {
    offset = 1;
  } else {
    offset = (weekdays[dayWord]! - now.weekday) % 7;
    isWeekday = true;
  }

  var result = DateTime(now.year, now.month, now.day + offset, hour24, minute);

  // A weekday name means the next occurrence, never one that has already passed.
  if (isWeekday && result.isBefore(now)) {
    result =
        DateTime(now.year, now.month, now.day + offset + 7, hour24, minute);
  }

  return result;
}
