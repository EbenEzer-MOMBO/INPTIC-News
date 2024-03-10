import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reponse_commentaire_model.dart';
export 'reponse_commentaire_model.dart';

class ReponseCommentaireWidget extends StatefulWidget {
  const ReponseCommentaireWidget({super.key});

  @override
  State<ReponseCommentaireWidget> createState() =>
      _ReponseCommentaireWidgetState();
}

class _ReponseCommentaireWidgetState extends State<ReponseCommentaireWidget> {
  late ReponseCommentaireModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReponseCommentaireModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            AuthUserStreamWidget(
              builder: (context) => ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  currentUserPhoto,
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        valueOrDefault(currentUserDocument?.prenom, ''),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 12.0,
                            ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Salut, l\'article est bien rédigé',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Color(0x00FFFFFF),
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: Color(0x00FFFFFF),
                icon: Icon(
                  Icons.favorite_border,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 19.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ].divide(SizedBox(width: 5.0)).addToStart(SizedBox(width: 20.0)),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: FlutterFlowIconButton(
                      borderColor: Color(0x00FFFFFF),
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 28.0,
                      fillColor: Color(0x00FFFFFF),
                      icon: Icon(
                        Icons.subdirectory_arrow_right_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      currentUserPhoto,
                      width: 25.0,
                      height: 25.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(currentUserDocument?.prenom, ''),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 11.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Salut, l\'article est bien rédigé',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 13.0,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Color(0x00FFFFFF),
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: Color(0x00FFFFFF),
                    icon: Icon(
                      Icons.favorite_border,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 17.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ].addToStart(SizedBox(width: 30.0)),
            ),
          ],
        ),
      ],
    );
  }
}
