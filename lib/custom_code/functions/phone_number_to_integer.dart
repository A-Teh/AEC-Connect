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

int phoneNumberToInteger(String? phoneNumber) {
  // Return a phone number in the form (XXX) XXX-XXXX to an integer
  if (phoneNumber == null || phoneNumber.isEmpty)
    return 0; // Return 0 if the phone number is null or empty
  String digits = phoneNumber.replaceAll(
      RegExp(r'\D'), ''); // Remove all non-digit characters
  if (digits.length != 10)
    return 0; // Return 0 if the number does not have exactly 10 digits
  return int.parse(digits); // Convert the cleaned string to an integer
}
