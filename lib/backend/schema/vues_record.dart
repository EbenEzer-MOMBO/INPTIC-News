import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VuesRecord extends FirestoreRecord {
  VuesRecord._(
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
          ? parent.collection('vues')
          : FirebaseFirestore.instance.collectionGroup('vues');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('vues').doc(id);

  static Stream<VuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VuesRecord.fromSnapshot(s));

  static Future<VuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VuesRecord.fromSnapshot(s));

  static VuesRecord fromSnapshot(DocumentSnapshot snapshot) => VuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVuesRecordData({
  DocumentReference? refArticle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refArticle': refArticle,
    }.withoutNulls,
  );

  return firestoreData;
}

class VuesRecordDocumentEquality implements Equality<VuesRecord> {
  const VuesRecordDocumentEquality();

  @override
  bool equals(VuesRecord? e1, VuesRecord? e2) {
    return e1?.refArticle == e2?.refArticle;
  }

  @override
  int hash(VuesRecord? e) => const ListEquality().hash([e?.refArticle]);

  @override
  bool isValidKey(Object? o) => o is VuesRecord;
}
