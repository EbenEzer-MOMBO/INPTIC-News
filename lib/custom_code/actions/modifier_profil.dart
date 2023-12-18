// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

//Tout ce fait dans une fonction
Future<void> modifierProfil(
    String nom, String prenom, String idUtilisateur) async {
  //juste un objet utilisateur
  final utilisateur =
      FirebaseFirestore.instance.collection('user').doc(idUtilisateur);

  // Et la requète
  await utilisateur.update({
    'nom': nom,
    'prenom': prenom,
  });
}
