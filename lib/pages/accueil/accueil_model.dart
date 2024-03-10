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
import 'accueil_widget.dart' show AccueilWidget;
import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccueilModel extends FlutterFlowModel<AccueilWidget> {
  ///  Local state fields for this page.

  String categorieSelectionne = 'TOUT';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
