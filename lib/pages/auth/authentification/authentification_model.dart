import '/auth/firebase_auth/auth_util.dart';
import '/composants/custom_alert/custom_alert_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'authentification_widget.dart' show AuthentificationWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthentificationModel extends FlutterFlowModel<AuthentificationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  final textFieldKey1 = GlobalKey();
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? textFieldSelectedOption1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - authentificationFirebase] action in Button widget.
  String? authResult;
  // State field(s) for nom widget.
  final nomKey = GlobalKey();
  FocusNode? nomFocusNode;
  TextEditingController? nomController;
  String? nomSelectedOption;
  String? Function(BuildContext, String?)? nomControllerValidator;
  // State field(s) for prenom widget.
  final prenomKey = GlobalKey();
  FocusNode? prenomFocusNode;
  TextEditingController? prenomController;
  String? prenomSelectedOption;
  String? Function(BuildContext, String?)? prenomControllerValidator;
  // State field(s) for email2 widget.
  final email2Key = GlobalKey();
  FocusNode? email2FocusNode;
  TextEditingController? email2Controller;
  String? email2SelectedOption;
  String? Function(BuildContext, String?)? email2ControllerValidator;
  // State field(s) for mdp2 widget.
  FocusNode? mdp2FocusNode;
  TextEditingController? mdp2Controller;
  late bool mdp2Visibility;
  String? Function(BuildContext, String?)? mdp2ControllerValidator;
  // Stores action output result for [Custom Action - inscriptionFirebase] action in Button widget.
  String? succesInscription;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    mdp2Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    nomFocusNode?.dispose();

    prenomFocusNode?.dispose();

    email2FocusNode?.dispose();

    mdp2FocusNode?.dispose();
    mdp2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
