// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future likeComment(String userId, DocumentReference refComment) async {
  final userRef = FirebaseFirestore.instance.collection('user').doc(userId);
  final commentCollectionRef = userRef.collection('likes');
  final existingDocument = await commentCollectionRef
      .where('commentRef', isEqualTo: refComment)
      .get();

  if (existingDocument.docs.isEmpty) {
    // Si le document n'existe pas, créez-le
    await commentCollectionRef.add({'commentRef': refComment});
    // Récupérer la référence du commentaire
    final commentDocSnapshot = await refComment.get();
    // Incrémenter le champ "Like"
    await refComment.update({'likes': FieldValue.increment(1)});
  } else {
    // Si le document existe, supprimez-le
    final documentId = existingDocument.docs.first.id;
    await commentCollectionRef.doc(documentId).delete();
    // Récupérer la référence de l'article
    final commentDocSnapshot = await refComment.get();
    // Décrémenter le champ "Like"
    await refComment.update({'likes': FieldValue.increment(-1)});
  }
}
