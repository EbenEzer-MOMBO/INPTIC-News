// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String> resendEmailVerification(String email) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
      await FirebaseAuth.instance.signOut();
      return 'Email renvoyé !';
    } else {
      await FirebaseAuth.instance.signOut();
      return 'Une erreur est survenue !';
    }
  } catch (e) {
    await FirebaseAuth.instance.signOut();
    return 'Une erreur est survenue !';
  }
}

Future<String> renvoiConfirmationMail(String email) async {
  String status = await resendEmailVerification(email);
  return status;
}
