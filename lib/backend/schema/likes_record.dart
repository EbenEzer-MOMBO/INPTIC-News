import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikesRecord extends FirestoreRecord {
  LikesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "refArticle" field.
  DocumentReference? _refArticle;
  DocumentReference? get refArticle => _refArticle;
  bool hasRefArticle() => _refArticle != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _refArticle = snapshotData['refArticle'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('likes')
          : FirebaseFirestore.instance.collectionGroup('likes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('likes').doc();

  static Stream<LikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikesRecord.fromSnapshot(s));

  static Future<LikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikesRecord.fromSnapshot(s));

  static LikesRecord fromSnapshot(DocumentSnapshot snapshot) => LikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikesRecordData({
  DocumentReference? refArticle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refArticle': refArticle,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikesRecordDocumentEquality implements Equality<LikesRecord> {
  const LikesRecordDocumentEquality();

  @override
  bool equals(LikesRecord? e1, LikesRecord? e2) {
    return e1?.refArticle == e2?.refArticle;
  }

  @override
  int hash(LikesRecord? e) => const ListEquality().hash([e?.refArticle]);

  @override
  bool isValidKey(Object? o) => o is LikesRecord;
}
