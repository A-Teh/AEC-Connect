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

/// Maps a course code to its AEC schedule abbreviation.
///
/// Takes a course code such as “ACC 201” or “mth141”, finds its subject by
/// prefix, and returns the schedule column that subject uses, such as “BUS”
/// for Business courses or “EGR” for Engineering. Spaces and case are
/// ignored. Returns null if the prefix isn’t recognized.
String? subjectAbbreviation(String subject) {
  const Map<String, String> _subjectAbbreviations = {
    'math': 'MTH',
    'chemistry': 'CHM',
    'business': 'BUS',
    'biology': 'BIO',
    'nursing': 'NUR',
    'computer science': 'CSC',
    'physics': 'PHY',
    'engineering': 'EGR',
    'economics': 'ECN',
    'statistics': 'STA',
  };

  /// Returns the abbreviation for a full subject name (e.g. "Math" -> "MTH"),
  /// or null if the subject isn't recognized. Matching ignores case and
  /// surrounding whitespace.

  return _subjectAbbreviations[subject.trim().toLowerCase()];
}
