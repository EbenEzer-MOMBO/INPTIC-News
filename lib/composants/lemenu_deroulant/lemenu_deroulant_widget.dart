import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lemenu_deroulant_model.dart';
export 'lemenu_deroulant_model.dart';

class LemenuDeroulantWidget extends StatefulWidget {
  const LemenuDeroulantWidget({Key? key}) : super(key: key);

  @override
  _LemenuDeroulantWidgetState createState() => _LemenuDeroulantWidgetState();
}

class _LemenuDeroulantWidgetState extends State<LemenuDeroulantWidget> {
  late LemenuDeroulantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LemenuDeroulantModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
        child: Container(
          width: 172.0,
          height: 130.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(9.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(9.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Favoris');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.favorite_outlined,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              Text(
                                'Favoris',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ].divide(SizedBox(width: 7.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.settings_rounded,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            Text(
                              'Paramètres',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ].divide(SizedBox(width: 7.0)),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Déconnexion'),
                                      content: Text('Vous serez déconnecté !'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Annuler'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmer'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth(
                                  'Authentification', context.mounted);

                              return;
                            } else {
                              return;
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.logout_sharp,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              Text(
                                'Déconnexion',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ].divide(SizedBox(width: 7.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 47.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 33.0,
                      icon: Icon(
                        Icons.close_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 20.0)),
          ),
        ),
      ),
    );
  }
}
