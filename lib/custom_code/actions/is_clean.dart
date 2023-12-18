// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:profanity_filter/profanity_filter.dart';

bool isClean(String text) {
  final profanityFilter = ProfanityFilter();
  return !profanityFilter.hasProfanity(text);
}
