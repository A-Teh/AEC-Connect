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

/// MTH141 -> MTH
String? scheduleAbbreviationForCourse(String? courseCode) {
  const prefixToSubject = {
    'ACC': 'Business',
    'BAI': 'Business',
    'BIO': 'Biology',
    'CMB': 'Biology',
    'BME': 'Engineering',
    'CVE': 'Engineering',
    'ELE': 'Engineering',
    'MCE': 'Engineering',
    'CHM': 'Chemistry',
    'CSC': 'Computer Science',
    'ECN': 'Economics',
    'MTH': 'Math',
    'NUR': 'Nursing',
    'PHY': 'Physics',
    'STA': 'Statistics',
  };

  const subjectToScheduleAbbreviation = {
    'Business': 'BUS',
    'Biology': 'BIO',
    'Engineering': 'EGR',
    'Chemistry': 'CHM',
    'Computer Science': 'CSC',
    'Economics': 'ECN',
    'Math': 'MTH',
    'Nursing': 'NUR',
    'Physics': 'PHY',
    'Statistics': 'STA',
  };

  if (courseCode != null) {
    final prefix = courseCode
        .toUpperCase()
        .replaceAll(' ', '')
        .replaceAll(RegExp(r'[^A-Z].*$'), '');
    final subject = prefixToSubject[prefix];
    return subjectToScheduleAbbreviation[subject];
  } else {
    return null;
  }
}
