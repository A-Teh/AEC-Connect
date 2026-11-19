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

bool? isProfileValid(
  String? displayName,
  String? studentId,
  int? phoneNumber,
) {
  // Return true only if displayName is at least two words, student ID is exactly 9 digits, and phone number is 10 digits.
  if (displayName == null || studentId == null || phoneNumber == null) {
    return false; // Return false if any input is null
  }

  bool isDisplayNameValid = displayName.split(' ').length >=
      2; // Check if displayName has at least two words
  bool isStudentIdValid =
      studentId.length == 9; // Check if studentId is exactly 9 digits
  bool isPhoneNumberValid = phoneNumber.toString().length ==
      10; // Check if phoneNumber is exactly 10 digits

  return isDisplayNameValid &&
      isStudentIdValid &&
      isPhoneNumberValid; // Return true only if all conditions are met
}
