import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _aLaUneManager = FutureRequestManager<List<ArticleRecord>>();
  Future<List<ArticleRecord>> aLaUne({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ArticleRecord>> Function() requestFn,
  }) =>
      _aLaUneManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearALaUneCache() => _aLaUneManager.clear();
  void clearALaUneCacheKey(String? uniqueKey) =>
      _aLaUneManager.clearRequest(uniqueKey);
}
