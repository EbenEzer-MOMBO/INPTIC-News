import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/composants/article_medium/article_medium_widget.dart';
import '/composants/article_small/article_small_widget.dart';
import '/composants/menu/menu_widget.dart';
import '/composants/menu_inkn/menu_inkn_widget.dart';
import '/composants/pas_images/pas_images_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'accueil_model.dart';
export 'accueil_model.dart';

class AccueilWidget extends StatefulWidget {
  const AccueilWidget({super.key});

  @override
  State<AccueilWidget> createState() => _AccueilWidgetState();
}

class _AccueilWidgetState extends State<AccueilWidget> {
  late AccueilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccueilModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            borderRadius: 8.0,
                            borderWidth: 1.0,
                            buttonSize: 48.0,
                            icon: Icon(
                              Icons.menu_outlined,
                              color: Colors.white,
                              size: 32.0,
                            ),
                            onPressed: () async {
                              if (valueOrDefault(
                                          currentUserDocument?.nom, '') !=
                                      null &&
                                  valueOrDefault(
                                          currentUserDocument?.nom, '') !=
                                      '') {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: MenuWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                return;
                              } else {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: MenuInknWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                return;
                              }
                            },
                          ),
                          FutureBuilder<int>(
                            future: queryNotificationRecordCount(
                              parent: currentUserReference,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitWanderingCubes(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              int badgeCount = snapshot.data!;
                              return badges.Badge(
                                badgeContent: Text(
                                  '1',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 6.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                showBadge: badgeCount > 0,
                                shape: badges.BadgeShape.circle,
                                badgeColor: Color(0xFFFF5984),
                                elevation: 4.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    1.0, 8.0, 18.0, 8.0),
                                position: badges.BadgePosition.topEnd(),
                                animationType: badges.BadgeAnimationType.scale,
                                toAnimate: true,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 48.0,
                                    icon: Icon(
                                      Icons.notifications_none,
                                      color: Colors.white,
                                      size: 32.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Notifications');
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      FFAppState().clearALaUneCache();
                      _model.firestoreRequestCompleted = false;
                    });
                    await _model.waitForFirestoreRequestCompleted();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      'A LA UNE ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 28.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 322.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: FutureBuilder<List<ArticleRecord>>(
                              future: FFAppState().aLaUne(
                                requestFn: () => queryArticleRecordOnce(
                                  queryBuilder: (articleRecord) => articleRecord
                                      .orderBy('date', descending: true),
                                  limit: 5,
                                ).then((result) {
                                  _model.firestoreRequestCompleted = true;
                                  return result;
                                }),
                              ),
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
                                List<ArticleRecord> listViewArticleRecordList =
                                    snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    25.0,
                                    0,
                                    25.0,
                                    0,
                                  ),
                                  primary: false,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listViewArticleRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(width: 25.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewArticleRecord =
                                        listViewArticleRecordList[
                                            listViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'Details',
                                          queryParameters: {
                                            'refArticle': serializeParam(
                                              listViewArticleRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: ArticleSmallWidget(
                                        key: Key(
                                            'Keyawx_${listViewIndex}_of_${listViewArticleRecordList.length}'),
                                        image: listViewArticleRecord.image,
                                        titre: listViewArticleRecord.titre,
                                        favori: false,
                                        date: listViewArticleRecord.date!,
                                        categorie:
                                            listViewArticleRecord.categorie,
                                        refArticle:
                                            listViewArticleRecord.reference,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'CATÉGORIES',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 25.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.categorieSelectionne =
                                                'TOUT';
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Tout',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF6B6B6B),
                                                    fontSize: 15.0,
                                                  ),
                                            ),
                                            if (_model.categorieSelectionne ==
                                                'TOUT')
                                              SizedBox(
                                                width: 31.0,
                                                child: Divider(
                                                  thickness: 3.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.categorieSelectionne =
                                                'ADMINISTRATION';
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Administration',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF6B6B6B),
                                                    fontSize: 15.0,
                                                  ),
                                            ),
                                            if (_model.categorieSelectionne ==
                                                'ADMINISTRATION')
                                              SizedBox(
                                                width: 31.0,
                                                child: Divider(
                                                  thickness: 3.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.categorieSelectionne =
                                                'SPORT';
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Sport',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF6B6B6B),
                                                    fontSize: 15.0,
                                                  ),
                                            ),
                                            if (_model.categorieSelectionne ==
                                                'SPORT')
                                              SizedBox(
                                                width: 31.0,
                                                child: Divider(
                                                  thickness: 3.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.categorieSelectionne =
                                                'EVENEMENT';
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Evènements',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF6B6B6B),
                                                    fontSize: 15.0,
                                                  ),
                                            ),
                                            if (_model.categorieSelectionne ==
                                                'EVENEMENT')
                                              SizedBox(
                                                width: 31.0,
                                                child: Divider(
                                                  thickness: 3.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.categorieSelectionne =
                                                'OFFRES/BOURSES';
                                          });
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Offres/Bourses',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF6B6B6B),
                                                    fontSize: 15.0,
                                                  ),
                                            ),
                                            if (_model.categorieSelectionne ==
                                                'OFFRES/BOURSES')
                                              SizedBox(
                                                width: 31.0,
                                                child: Divider(
                                                  thickness: 3.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 25.0))
                                        .addToStart(SizedBox(width: 25.0))
                                        .addToEnd(SizedBox(width: 25.0)),
                                  ),
                                ),
                              ),
                              if (_model.categorieSelectionne == 'TOUT')
                                StreamBuilder<List<ArticleRecord>>(
                                  stream: queryArticleRecord(),
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
                                    List<ArticleRecord>
                                        listViewAllArticleRecordList =
                                        snapshot.data!;
                                    if (listViewAllArticleRecordList.isEmpty) {
                                      return Container(
                                        width: double.infinity,
                                        child: PasImagesWidget(),
                                      );
                                    }
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        50.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewAllArticleRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 20.0),
                                      itemBuilder: (context, listViewAllIndex) {
                                        final listViewAllArticleRecord =
                                            listViewAllArticleRecordList[
                                                listViewAllIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'Details',
                                              queryParameters: {
                                                'refArticle': serializeParam(
                                                  listViewAllArticleRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ArticleMediumWidget(
                                            key: Key(
                                                'Keyce0_${listViewAllIndex}_of_${listViewAllArticleRecordList.length}'),
                                            image:
                                                listViewAllArticleRecord.image,
                                            titre:
                                                listViewAllArticleRecord.titre,
                                            favori: false,
                                            date:
                                                listViewAllArticleRecord.date!,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              if (_model.categorieSelectionne != 'TOUT')
                                StreamBuilder<List<ArticleRecord>>(
                                  stream: queryArticleRecord(
                                    queryBuilder: (articleRecord) =>
                                        articleRecord.where(
                                      'categorie',
                                      isEqualTo: _model.categorieSelectionne,
                                    ),
                                  ),
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
                                    List<ArticleRecord>
                                        listViewCategoriesArticleRecordList =
                                        snapshot.data!;
                                    if (listViewCategoriesArticleRecordList
                                        .isEmpty) {
                                      return PasImagesWidget();
                                    }
                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        50.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewCategoriesArticleRecordList
                                              .length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 20.0),
                                      itemBuilder:
                                          (context, listViewCategoriesIndex) {
                                        final listViewCategoriesArticleRecord =
                                            listViewCategoriesArticleRecordList[
                                                listViewCategoriesIndex];
                                        return ArticleMediumWidget(
                                          key: Key(
                                              'Key9lf_${listViewCategoriesIndex}_of_${listViewCategoriesArticleRecordList.length}'),
                                          image: listViewCategoriesArticleRecord
                                              .image,
                                          titre: listViewCategoriesArticleRecord
                                              .titre,
                                          favori: false,
                                          date: listViewCategoriesArticleRecord
                                              .date!,
                                        );
                                      },
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 25.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('Recherche');
                },
                child: Container(
                  width: double.infinity,
                  height: 47.0,
                  decoration: BoxDecoration(
                    color: Color(0x58AAAAAA),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.search_sharp,
                        color: Color(0x5BFFFFFF),
                        size: 26.0,
                      ),
                      Text(
                        'Recherche ...',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0x5BFFFFFF),
                            ),
                      ),
                    ]
                        .divide(SizedBox(width: 5.0))
                        .addToStart(SizedBox(width: 12.0)),
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
