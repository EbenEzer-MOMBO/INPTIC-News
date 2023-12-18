import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'a_propos_model.dart';
export 'a_propos_model.dart';

class AProposWidget extends StatefulWidget {
  const AProposWidget({Key? key}) : super(key: key);

  @override
  _AProposWidgetState createState() => _AProposWidgetState();
}

class _AProposWidgetState extends State<AProposWidget> {
  late AProposModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AProposModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 59.0,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'A propos',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'INPTIC\'s Digital News',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF464D77),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  child: Text(
                    'INPTIC\'s Digital News est une application de journal numérique permettant d\'une part à un ou plusieurs éditeurs de créer des articles et gérer leurs contenus grâce à la partie administrateur; et d\'autre part à un utilisateur de liker, commenter ou/et enregistrer ces articles grâce à la partie utilisateur. ',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 14.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Fonctionalités:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  child: Text(
                    '_ Création de compte utilisateur.\n_ Connexion à un compte avec Email et mot de passe.\n_ Organisation des articles en catégories .\n_ Création d\'articles avec des entrées textuelles pour les titres et contenus ainsi que des images.\n_Possibilité de liker, commenter et enregistrer des articles.',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: Text(
                      'Cette application cible principalement l\'INPTIC (Institut National de la Poste des technologie de l\'Information et de la Communication), mais peut être adaptée à toutes autres universités et grandes écoles. ',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Plateformes prises en charge:',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Android, Web.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF464D77),
                          ),
                    ),
                  ]
                      .divide(SizedBox(width: 5.0))
                      .addToStart(SizedBox(width: 30.0))
                      .addToEnd(SizedBox(width: 30.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  child: Text(
                    'INPTIC\'s Digital News a été développée par MOMBO Jean-Bernard Eben-Ezer et MOUBOUENGHOU MOUKAGNI Merveilles Verônne, étudiants de troisième et deuxième année de la filère Génie Informatique (GI) à l\'INPTIC, dans le but de dynamiser et sécuriser la transmition des informations au sein d\'une école. ',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Biographie des developpeurs:',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.94,
                  height: 125.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF464D77),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 7.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              'assets/images/WhatsApp_Image_2023-11-03__19.22.08_833afc85.jpg',
                              width: 100.0,
                              height: 110.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 100.0, 0.0),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Nom(s):',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xA2FFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ' MOMBO',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Prénom(s):',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xA2FFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' Jean Bernard Eben-Ezer',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 98.0, 0.0),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tel:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xA2FFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ' +241 62648538',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 48.0, 0.0),
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Github:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xA2FFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' EbenEzer-MOMBO',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 22.0, 0.0),
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Email:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xA3FFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: 'misterjustice@gmail.com',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 3.0))
                            .addToStart(SizedBox(height: 10.0))
                            .addToEnd(SizedBox(height: 10.0)),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.94,
                  height: 125.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF464D77),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 7.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              'assets/images/WhatsApp_Image_2023-05-28__18.22.44.jpg',
                              width: 100.0,
                              height: 110.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Nom(s):',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xA2FFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ' MOUBOUENGHOU M.',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Prénom(s):',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xA2FFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' Merveilles Verônne',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 65.0, 0.0),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Tel:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xA2FFFFFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ' +241 76289045',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 17.0, 0.0),
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Github:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xA2FFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' MerveillesVeronne',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 3.0, 0.0),
                            child: RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Email:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xA3FFFFFF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' veromoub@gmail.com',
                                    style: TextStyle(),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 3.0))
                            .addToStart(SizedBox(height: 10.0))
                            .addToEnd(SizedBox(height: 10.0)),
                      ),
                    ],
                  ),
                ),
              ]
                  .divide(SizedBox(height: 25.0))
                  .addToStart(SizedBox(height: 20.0))
                  .addToEnd(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
