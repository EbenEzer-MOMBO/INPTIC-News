import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'le_commentaire_model.dart';
export 'le_commentaire_model.dart';

class LeCommentaireWidget extends StatefulWidget {
  const LeCommentaireWidget({
    super.key,
    required this.image,
    required this.nom,
    required this.prenom,
    required this.texte,
    int? like,
    required this.refComment,
    required this.date,
  }) : this.like = like ?? 0;

  final String? image;
  final String? nom;
  final String? prenom;
  final String? texte;
  final int like;
  final DocumentReference? refComment;
  final DateTime? date;

  @override
  State<LeCommentaireWidget> createState() => _LeCommentaireWidgetState();
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isCommentLiked = await actions.estLike(
        currentUserReference!.id,
        widget.refComment!,
      );
      if (_model.isCommentLiked == true) {
        setState(() {
          _model.isLiked = true;
        });
        return;
      } else {
        return;
      }
    });
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
          child: Row(
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
                      textScaler: MediaQuery.of(context).textScaler,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                      child: Text(
                        widget.texte!,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        dateTimeFormat(
                          'relative',
                          widget.date,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFB8B8B8),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Container(
                  width: 38.0,
                  height: 58.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ToggleIcon(
                        onPressed: () async {
                          setState(() => _model.isLiked = !_model.isLiked);
                          await actions.likeComment(
                            currentUserReference!.id,
                            widget.refComment!,
                          );
                          _model.soundPlayer ??= AudioPlayer();
                          if (_model.soundPlayer!.playing) {
                            await _model.soundPlayer!.stop();
                          }
                          _model.soundPlayer!.setVolume(1.0);
                          _model.soundPlayer!
                              .setAsset('assets/audios/pop.mp3')
                              .then((_) => _model.soundPlayer!.play());
                        },
                        value: _model.isLiked,
                        onIcon: Icon(
                          Icons.favorite_rounded,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20.0,
                        ),
                        offIcon: Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.like.toString(),
                            '0',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFFB8B8B8),
                                    fontSize: 13.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 20.0)),
          ),
        ),
      ],
    );
  }
}
