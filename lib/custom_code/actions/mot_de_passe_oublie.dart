// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String> motDePasseOublie(String email) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.sendPasswordResetEmail(email: email);
    return 'E-mail de réinitialisation envoyé à $email';
  } catch (e) {
    String errorMessage =
        'Erreur lors de l\'envoi de l\'e-mail de réinitialisation';

    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          errorMessage =
              'Adresse e-mail invalide. Veuillez vérifier l\'adresse saisie.';
          break;
        case 'user-not-found':
          errorMessage =
              'Aucun utilisateur n\'est associé à cette adresse e-mail.';
          break;
        case 'too-many-requests':
          errorMessage =
              'Trop de tentatives de réinitialisation de mot de passe. Veuillez réessayer plus tard.';
          break;
        // Ajoutez d'autres cas d'erreur selon vos besoins.
        default:
          break;
      }
    }

    return errorMessage;
  }
}
