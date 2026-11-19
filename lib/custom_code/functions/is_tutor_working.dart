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

/// It takes a tutor's availability records and checks whether the current
/// local time falls within any of their scheduled blocks.
bool? isTutorWorking(
  List<dynamic>? availability,
  String? subject,
) {
  if (availability == null || availability.isEmpty) return false;

  final now = DateTime.now();
  const dayNames = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday',
  ];
  final today = dayNames[now.weekday - 1]; // DateTime.weekday: Monday = 1
  final nowMinutes = now.hour * 60 + now.minute;

  final wanted = (subject ?? '').trim().toLowerCase();
  final checkAll = wanted.isEmpty || wanted == 'all';

  // "4:00 PM" / "10:30 AM" / "4pm" -> minutes after midnight, or null if malformed.
  int? parseMinutes(dynamic value) {
    if (value == null) return null;
    final match = RegExp(r'^\s*(\d{1,2})(?::(\d{2}))?\s*([AaPp])\.?[Mm]\.?\s*$')
        .firstMatch(value.toString());
    if (match == null) return null;
    final hour = int.parse(match.group(1)!);
    final minute = int.tryParse(match.group(2) ?? '0') ?? 0;
    if (hour < 1 || hour > 12 || minute > 59) return null;
    final isPm = match.group(3)!.toLowerCase() == 'p';
    return (hour % 12 + (isPm ? 12 : 0)) * 60 + minute;
  }

  for (final item in availability) {
    if (item is! Map) continue;

    final day = item['dayOfWeek']?.toString().trim().toLowerCase();
    if (day != today) continue;

    if (!checkAll) {
      final recordSubject = item['subject']?.toString().trim().toLowerCase();
      if (recordSubject != wanted) continue;
    }

    final start = parseMinutes(item['startTime']);
    final end = parseMinutes(item['endTime']);
    if (start == null || end == null) continue;

    if (nowMinutes >= start && nowMinutes < end) return true;
  }
  return false;
}
