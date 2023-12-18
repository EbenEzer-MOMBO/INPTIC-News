import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_deroulant_model.dart';
export 'menu_deroulant_model.dart';

class MenuDeroulantWidget extends StatefulWidget {
  const MenuDeroulantWidget({Key? key}) : super(key: key);

  @override
  _MenuDeroulantWidgetState createState() => _MenuDeroulantWidgetState();
}

class _MenuDeroulantWidgetState extends State<MenuDeroulantWidget> {
  late MenuDeroulantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuDeroulantModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 120.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(7.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Color(0x00FFFFFF),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 34.0,
                  fillColor: Color(0x00FFFFFF),
                  icon: Icon(
                    Icons.star_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 19.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                Text(
                  'Favoris ',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Container(
            width: 120.0,
            height: 35.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(7.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Color(0x00FFFFFF),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 34.0,
                  fillColor: Color(0x00FFFFFF),
                  icon: Icon(
                    Icons.settings_sharp,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 18.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                Text(
                  'Paramètres',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
