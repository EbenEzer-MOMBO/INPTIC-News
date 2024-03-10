// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> estLike(String userId, DocumentReference refComment) async {
  final userRef = FirebaseFirestore.instance.collection('user').doc(userId);
  final commentCollectionRef = userRef.collection('likes');
  final existingDocuments = await commentCollectionRef
      .where('commentRef', isEqualTo: refComment)
      .get();

  return existingDocuments.docs.isNotEmpty;
}
