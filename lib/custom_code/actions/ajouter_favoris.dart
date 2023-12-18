// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> ajouterFavoris(
    String userId, DocumentReference refArticle) async {
  final userRef = FirebaseFirestore.instance.collection('user').doc(userId);
  final favoriteCollectionRef = userRef.collection('favoris');
  final existingDocument = await favoriteCollectionRef
      .where('refArticle', isEqualTo: refArticle)
      .get();

  if (existingDocument.docs.isEmpty) {
    // Si le document n'existe pas, créez-le
    await favoriteCollectionRef.add({'refArticle': refArticle});
    return 'Ajouté aux favoris !';
  } else {
    // Si le document existe, supprimez-le
    final documentId = existingDocument.docs.first.id;
    await favoriteCollectionRef.doc(documentId).delete();
    return 'Retiré des favoris !';
  }
}
