import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SectionCommentRecord extends FirestoreRecord {
  SectionCommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nbre_commentaire" field.
  int? _nbreCommentaire;
  int get nbreCommentaire => _nbreCommentaire ?? 0;
  bool hasNbreCommentaire() => _nbreCommentaire != null;

  // "refArticle" field.
  DocumentReference? _refArticle;
  DocumentReference? get refArticle => _refArticle;
  bool hasRefArticle() => _refArticle != null;

  void _initializeFields() {
    _nbreCommentaire = castToType<int>(snapshotData['nbre_commentaire']);
    _refArticle = snapshotData['refArticle'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('section_comment');

  static Stream<SectionCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SectionCommentRecord.fromSnapshot(s));

  static Future<SectionCommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SectionCommentRecord.fromSnapshot(s));

  static SectionCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SectionCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SectionCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SectionCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SectionCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SectionCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSectionCommentRecordData({
  int? nbreCommentaire,
  DocumentReference? refArticle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nbre_commentaire': nbreCommentaire,
      'refArticle': refArticle,
    }.withoutNulls,
  );

  return firestoreData;
}

class SectionCommentRecordDocumentEquality
    implements Equality<SectionCommentRecord> {
  const SectionCommentRecordDocumentEquality();

  @override
  bool equals(SectionCommentRecord? e1, SectionCommentRecord? e2) {
    return e1?.nbreCommentaire == e2?.nbreCommentaire &&
        e1?.refArticle == e2?.refArticle;
  }

  @override
  int hash(SectionCommentRecord? e) =>
      const ListEquality().hash([e?.nbreCommentaire, e?.refArticle]);

  @override
  bool isValidKey(Object? o) => o is SectionCommentRecord;
}
