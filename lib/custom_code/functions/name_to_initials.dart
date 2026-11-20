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

String? nameToInitials(String name) {
  // Returns the 2 Initials of a given name
  if (name.isEmpty) return null; // Return null if the name is empty
  List<String> parts = name.split(' '); // Split the name by spaces
  String initials = ''; // Initialize an empty string for initials
  for (var part in parts) {
    if (part.isNotEmpty) {
      initials += part[0]
          .toUpperCase(); // Add the first letter of each part to initials
    }
  }
  return initials.length > 2
      ? initials.substring(0, 2)
      : initials; // Return the first 2 initials
}
