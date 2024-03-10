import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavorisRecord extends FirestoreRecord {
  FavorisRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "refArticle" field.
  DocumentReference? _refArticle;
  DocumentReference? get refArticle => _refArticle;
  bool hasRefArticle() => _refArticle != null;

  // "trueClic" field.
  bool? _trueClic;
  bool get trueClic => _trueClic ?? false;
  bool hasTrueClic() => _trueClic != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _refArticle = snapshotData['refArticle'] as DocumentReference?;
    _trueClic = snapshotData['trueClic'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('favoris')
          : FirebaseFirestore.instance.collectionGroup('favoris');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('favoris').doc(id);

  static Stream<FavorisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavorisRecord.fromSnapshot(s));

  static Future<FavorisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavorisRecord.fromSnapshot(s));

  static FavorisRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavorisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavorisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavorisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavorisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavorisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavorisRecordData({
  DocumentReference? refArticle,
  bool? trueClic,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'refArticle': refArticle,
      'trueClic': trueClic,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavorisRecordDocumentEquality implements Equality<FavorisRecord> {
  const FavorisRecordDocumentEquality();

  @override
  bool equals(FavorisRecord? e1, FavorisRecord? e2) {
    return e1?.refArticle == e2?.refArticle && e1?.trueClic == e2?.trueClic;
  }

  @override
  int hash(FavorisRecord? e) =>
      const ListEquality().hash([e?.refArticle, e?.trueClic]);

  @override
  bool isValidKey(Object? o) => o is FavorisRecord;
}
