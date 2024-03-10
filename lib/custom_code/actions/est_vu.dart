// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future estVu(String userId, DocumentReference refArticle) async {
  final userRef = FirebaseFirestore.instance.collection('user').doc(userId);
  final vueCollectionRef = userRef.collection('vues');
  final existingDocument =
      await vueCollectionRef.where('refArticle', isEqualTo: refArticle).get();

  if (existingDocument.docs.isEmpty) {
    // Si le document n'existe pas, créez-le
    await vueCollectionRef.add({'refArticle': refArticle});
    // Récupérer la référence de l'article
    final articleDocSnapshot = await refArticle.get();
    await refArticle.update({'vue': FieldValue.increment(1)});
  }
}
