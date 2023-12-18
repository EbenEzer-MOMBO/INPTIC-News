import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentaireRecord extends FirestoreRecord {
  CommentaireRecord._(
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

  // "refSectionCom" field.
  DocumentReference? _refSectionCom;
  DocumentReference? get refSectionCom => _refSectionCom;
  bool hasRefSectionCom() => _refSectionCom != null;

  // "refUtilisateur" field.
  DocumentReference? _refUtilisateur;
  DocumentReference? get refUtilisateur => _refUtilisateur;
  bool hasRefUtilisateur() => _refUtilisateur != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _texte = snapshotData['texte'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _refSectionCom = snapshotData['refSectionCom'] as DocumentReference?;
    _refUtilisateur = snapshotData['refUtilisateur'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Commentaire');

  static Stream<CommentaireRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentaireRecord.fromSnapshot(s));

  static Future<CommentaireRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentaireRecord.fromSnapshot(s));

  static CommentaireRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentaireRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentaireRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentaireRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentaireRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentaireRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentaireRecordData({
  String? texte,
  int? likes,
  DocumentReference? refSectionCom,
  DocumentReference? refUtilisateur,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'texte': texte,
      'likes': likes,
      'refSectionCom': refSectionCom,
      'refUtilisateur': refUtilisateur,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentaireRecordDocumentEquality implements Equality<CommentaireRecord> {
  const CommentaireRecordDocumentEquality();

  @override
  bool equals(CommentaireRecord? e1, CommentaireRecord? e2) {
    return e1?.texte == e2?.texte &&
        e1?.likes == e2?.likes &&
        e1?.refSectionCom == e2?.refSectionCom &&
        e1?.refUtilisateur == e2?.refUtilisateur &&
        e1?.date == e2?.date;
  }

  @override
  int hash(CommentaireRecord? e) => const ListEquality()
      .hash([e?.texte, e?.likes, e?.refSectionCom, e?.refUtilisateur, e?.date]);

  @override
  bool isValidKey(Object? o) => o is CommentaireRecord;
}
