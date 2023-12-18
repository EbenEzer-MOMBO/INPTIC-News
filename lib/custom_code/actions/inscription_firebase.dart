// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

// véfication format email avec regex
bool isEmailValid(String email) {
  String emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  RegExp regex = RegExp(emailRegex);
  return regex.hasMatch(email);
}

Future<String> inscriptionFirebase(
  String name,
  String firstname,
  String emailAddress,
  String password,
  String messageInvalidEmail,
  String messageShortPassword,
  String emptyFields,
) async {
  String returnCreate = "success";
  if (name.isEmpty ||
      firstname.isEmpty ||
      emailAddress.isEmpty ||
      password.isEmpty) {
    returnCreate = emptyFields;
    return returnCreate;
  } else if (!isEmailValid(emailAddress)) {
    returnCreate = messageInvalidEmail;
    return returnCreate;
  } else if (password.length < 6) {
    returnCreate = messageShortPassword;
    return returnCreate;
  } else {
    try {
      UserCredential? userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (userCredential?.user != null) {
        // détails supplémentaires
        await saveUserDetails(
            userCredential.user!.uid, name, firstname, emailAddress);

        // email de vérification
        await userCredential.user!.sendEmailVerification();

        // succès inscription
        return returnCreate;
      } else {
        returnCreate = "Une erreur est survenue, veuillez réessayer.";
        return returnCreate;
      }
    } catch (e) {
      returnCreate = "Une erreur est survenue, veuillez réessayer.";
      return returnCreate;
    }
  }
}

// enregistrer infos supplémentaires
Future<void> saveUserDetails(
    String userId, String name, String firstname, String emailAddress) async {
  DateTime currentTime = DateTime.now();
  bool editeur = false;

  await FirebaseFirestore.instance.collection('user').doc(userId).set({
    'nom': name,
    'prenom': firstname,
    'email': emailAddress,
    'creation': currentTime,
    'editeur': editeur,
  });
}
