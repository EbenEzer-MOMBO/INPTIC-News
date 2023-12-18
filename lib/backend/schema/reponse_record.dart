import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReponseRecord extends FirestoreRecord {
  ReponseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "texte" field.
  String? _texte;
  String get texte => _texte ?? '';
  bool hasTexte() => _texte != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "refUtilisateur" field.
  DocumentReference? _refUtilisateur;
  DocumentReference? get refUtilisateur => _refUtilisateur;
  bool hasRefUtilisateur() => _refUtilisateur != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _texte = snapshotData['texte'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _refUtilisateur = snapshotData['refUtilisateur'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Reponse')
          : FirebaseFirestore.instance.collectionGroup('Reponse');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Reponse').doc();

  static Stream<ReponseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReponseRecord.fromSnapshot(s));

  static Future<ReponseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReponseRecord.fromSnapshot(s));

  static ReponseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReponseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReponseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReponseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReponseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReponseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReponseRecordData({
  String? texte,
  int? likes,
  DocumentReference? refUtilisateur,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'texte': texte,
      'likes': likes,
      'refUtilisateur': refUtilisateur,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReponseRecordDocumentEquality implements Equality<ReponseRecord> {
  const ReponseRecordDocumentEquality();

  @override
  bool equals(ReponseRecord? e1, ReponseRecord? e2) {
    return e1?.texte == e2?.texte &&
        e1?.likes == e2?.likes &&
        e1?.refUtilisateur == e2?.refUtilisateur &&
        e1?.date == e2?.date;
  }

  @override
  int hash(ReponseRecord? e) => const ListEquality()
      .hash([e?.texte, e?.likes, e?.refUtilisateur, e?.date]);

  @override
  bool isValidKey(Object? o) => o is ReponseRecord;
}
