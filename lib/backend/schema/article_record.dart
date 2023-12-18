import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticleRecord extends FirestoreRecord {
  ArticleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titre" field.
  String? _titre;
  String get titre => _titre ?? '';
  bool hasTitre() => _titre != null;

  // "categorie" field.
  String? _categorie;
  String get categorie => _categorie ?? '';
  bool hasCategorie() => _categorie != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "contenu" field.
  String? _contenu;
  String get contenu => _contenu ?? '';
  bool hasContenu() => _contenu != null;

  // "Like" field.
  int? _like;
  int get like => _like ?? 0;
  bool hasLike() => _like != null;

  // "vue" field.
  int? _vue;
  int get vue => _vue ?? 0;
  bool hasVue() => _vue != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "idArticle" field.
  String? _idArticle;
  String get idArticle => _idArticle ?? '';
  bool hasIdArticle() => _idArticle != null;

  // "section_commentaire" field.
  DocumentReference? _sectionCommentaire;
  DocumentReference? get sectionCommentaire => _sectionCommentaire;
  bool hasSectionCommentaire() => _sectionCommentaire != null;

  // "Editeur" field.
  DocumentReference? _editeur;
  DocumentReference? get editeur => _editeur;
  bool hasEditeur() => _editeur != null;

  void _initializeFields() {
    _titre = snapshotData['titre'] as String?;
    _categorie = snapshotData['categorie'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _contenu = snapshotData['contenu'] as String?;
    _like = castToType<int>(snapshotData['Like']);
    _vue = castToType<int>(snapshotData['vue']);
    _image = snapshotData['image'] as String?;
    _idArticle = snapshotData['idArticle'] as String?;
    _sectionCommentaire =
        snapshotData['section_commentaire'] as DocumentReference?;
    _editeur = snapshotData['Editeur'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('article');

  static Stream<ArticleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticleRecord.fromSnapshot(s));

  static Future<ArticleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticleRecord.fromSnapshot(s));

  static ArticleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticleRecordData({
  String? titre,
  String? categorie,
  DateTime? date,
  String? contenu,
  int? like,
  int? vue,
  String? image,
  String? idArticle,
  DocumentReference? sectionCommentaire,
  DocumentReference? editeur,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titre': titre,
      'categorie': categorie,
      'date': date,
      'contenu': contenu,
      'Like': like,
      'vue': vue,
      'image': image,
      'idArticle': idArticle,
      'section_commentaire': sectionCommentaire,
      'Editeur': editeur,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticleRecordDocumentEquality implements Equality<ArticleRecord> {
  const ArticleRecordDocumentEquality();

  @override
  bool equals(ArticleRecord? e1, ArticleRecord? e2) {
    return e1?.titre == e2?.titre &&
        e1?.categorie == e2?.categorie &&
        e1?.date == e2?.date &&
        e1?.contenu == e2?.contenu &&
        e1?.like == e2?.like &&
        e1?.vue == e2?.vue &&
        e1?.image == e2?.image &&
        e1?.idArticle == e2?.idArticle &&
        e1?.sectionCommentaire == e2?.sectionCommentaire &&
        e1?.editeur == e2?.editeur;
  }

  @override
  int hash(ArticleRecord? e) => const ListEquality().hash([
        e?.titre,
        e?.categorie,
        e?.date,
        e?.contenu,
        e?.like,
        e?.vue,
        e?.image,
        e?.idArticle,
        e?.sectionCommentaire,
        e?.editeur
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticleRecord;
}
