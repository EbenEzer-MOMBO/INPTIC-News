import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pas_images_model.dart';
export 'pas_images_model.dart';

class PasImagesWidget extends StatefulWidget {
  const PasImagesWidget({Key? key}) : super(key: key);

  @override
  _PasImagesWidgetState createState() => _PasImagesWidgetState();
}

class _PasImagesWidgetState extends State<PasImagesWidget> {
  late PasImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasImagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterFlowIconButton(
            borderColor: Color(0x00FFFFFF),
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            fillColor: Color(0x00FFFFFF),
            icon: Icon(
              Icons.update_sharp,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 28.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          Text(
            'Aucun article',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}
