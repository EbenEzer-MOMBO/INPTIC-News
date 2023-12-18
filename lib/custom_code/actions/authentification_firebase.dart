// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String> authentificationFirebase(
  String emailAddress,
  String password,
  String messageInvalidEmail,
  String messageWrongPassword,
  String messageUserNotFound,
  String messageEmailNotVerified,
) async {
  String returnAuth = "valid";
  if (emailAddress.isEmpty || password.isEmpty) {
    returnAuth = "Email ou mot de passe vide !";
    return returnAuth;
  } else {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      if (!userCredential.user!.emailVerified) {
        // Vous pouvez renvoyer un message ici si l'e-mail n'est pas vérifié.
        returnAuth = "noAuth";
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          returnAuth = messageInvalidEmail;
          break;
        case 'wrong-password':
          returnAuth = messageWrongPassword;
          break;
        case 'user-not-found':
          returnAuth = messageUserNotFound;
          break;
        default:
          // Gérez les autres erreurs Firebase ici.
          returnAuth = "Une erreur s'est produite lors de l'authentification.";
          break;
      }
    }
    return returnAuth;
  }
}
