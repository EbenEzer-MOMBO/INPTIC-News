import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/composants/notification/notification_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());
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
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 34.0,
              icon: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 29.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
          ),
          title: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Roboto',
                  fontSize: 24.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: StreamBuilder<List<NotificationRecord>>(
          stream: queryNotificationRecord(
            parent: currentUserReference,
            queryBuilder: (notificationRecord) =>
                notificationRecord.orderBy('date', descending: true),
            limit: 10,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitWanderingCubes(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 50.0,
                  ),
                ),
              );
            }
            List<NotificationRecord> listViewNotificationRecordList =
                snapshot.data!;
            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                8.0,
                0,
                44.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: listViewNotificationRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 10.0),
              itemBuilder: (context, listViewIndex) {
                final listViewNotificationRecord =
                    listViewNotificationRecordList[listViewIndex];
                return NotificationWidget(
                  key: Key(
                      'Keyin8_${listViewIndex}_of_${listViewNotificationRecordList.length}'),
                  refarticle: listViewNotificationRecord.refArticle!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
