import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/composants/le_commentaire/le_commentaire_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'section_commentaire_model.dart';
export 'section_commentaire_model.dart';

class SectionCommentaireWidget extends StatefulWidget {
  const SectionCommentaireWidget({
    Key? key,
    required this.refArticle,
    required this.refSectionCommentaire,
  }) : super(key: key);

  final DocumentReference? refArticle;
  final DocumentReference? refSectionCommentaire;

  @override
  _SectionCommentaireWidgetState createState() =>
      _SectionCommentaireWidgetState();
}

class _SectionCommentaireWidgetState extends State<SectionCommentaireWidget> {
  late SectionCommentaireModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionCommentaireModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.75,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 60.0,
                      child: Divider(
                        height: 20.0,
                        thickness: 2.5,
                        color: Color(0xCC000000),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Commentaires',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Color(0xCC838383),
                    ),
                    StreamBuilder<List<CommentaireRecord>>(
                      stream: queryCommentaireRecord(
                        queryBuilder: (commentaireRecord) => commentaireRecord
                            .where(
                              'refSectionCom',
                              isEqualTo: widget.refSectionCommentaire,
                            )
                            .orderBy('date', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitWanderingCubes(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<CommentaireRecord> listViewCommentaireRecordList =
                            snapshot.data!;
                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            15.0,
                            0,
                            65.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewCommentaireRecordList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 20.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewCommentaireRecord =
                                listViewCommentaireRecordList[listViewIndex];
                            return StreamBuilder<UserRecord>(
                              stream: UserRecord.getDocument(
                                  listViewCommentaireRecord.refUtilisateur!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitWanderingCubes(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final containerUserRecord = snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(),
                                  child: LeCommentaireWidget(
                                    key: Key(
                                        'Keyziz_${listViewIndex}_of_${listViewCommentaireRecordList.length}'),
                                    image: valueOrDefault<String>(
                                      containerUserRecord.photoUrl,
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png',
                                    ),
                                    nom: containerUserRecord.nom,
                                    prenom: containerUserRecord.prenom,
                                    texte: listViewCommentaireRecord.texte,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.isClean = await actions.isClean(
                              _model.textController.text,
                            );
                            if (_model.isClean == true) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('clean'),
                                    content: Text('clean'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            setState(() {});
                          },
                          child: Container(
                            width: 36.0,
                            height: 36.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              valueOrDefault<String>(
                                currentUserPhoto,
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: 'Ajouter un commentaire ...',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xC114181B),
                                ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.send_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (_model.textController.text != null &&
                              _model.textController.text != '') {
                            await CommentaireRecord.collection.doc().set({
                              ...createCommentaireRecordData(
                                texte: _model.textController.text,
                                likes: 0,
                                refUtilisateur: currentUserReference,
                                refSectionCom: widget.refSectionCommentaire,
                              ),
                              ...mapToFirestore(
                                {
                                  'date': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            setState(() {
                              _model.textController?.clear();
                            });

                            await widget.refSectionCommentaire!.update({
                              ...mapToFirestore(
                                {
                                  'nbre_commentaire': FieldValue.increment(1),
                                },
                              ),
                            });
                            return;
                          } else {
                            return;
                          }
                        },
                      ),
                    ].divide(SizedBox(width: 6.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
