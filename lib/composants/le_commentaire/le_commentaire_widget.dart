import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'le_commentaire_model.dart';
export 'le_commentaire_model.dart';

class LeCommentaireWidget extends StatefulWidget {
  const LeCommentaireWidget({
    Key? key,
    required this.image,
    required this.nom,
    required this.prenom,
    required this.texte,
  }) : super(key: key);

  final String? image;
  final String? nom;
  final String? prenom;
  final String? texte;

  @override
  _LeCommentaireWidgetState createState() => _LeCommentaireWidgetState();
}

class _LeCommentaireWidgetState extends State<LeCommentaireWidget> {
  late LeCommentaireModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeCommentaireModel());
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  valueOrDefault<String>(
                    widget.image,
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/2048px-Default_pfp.svg.png',
                  ),
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.nom!,
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: widget.prenom!,
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                    child: Text(
                      widget.texte!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
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
            ),
          ].divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 20.0)),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(61.0, 0.0, 0.0, 0.0),
            child: Text(
              'Répondre',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Color(0xFFB8B8B8),
                    fontSize: 13.0,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
