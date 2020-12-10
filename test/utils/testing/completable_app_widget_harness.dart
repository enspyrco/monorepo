import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/utils/redux_bundle.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';
import 'package:the_process/widgets/app_widget/app_widget.dart';

import '../../mocks/redux/completable_fake_redux_bundle.dart';
import '../../mocks/wrappers/completable_fake_firebase_wrapper.dart';

/// A test harness to wrap the widget under test, (in this case the
/// AppWidget), and provide all the functionality
/// that a test may want in order to interact with the widget, including
/// completing the firebase and redux futures that are awaited in the
/// AppWidget.
class CompletableAppWidgetHarness {
  final _firebaseCompleter = Completer<FirebaseApp>();
  final _reduxCompleter = Completer<Store<AppState>>();

  FirebaseWrapper _firebase;
  ReduxBundle _redux;
  AppWidget _appWidget;

  CompletableAppWidgetHarness({FirebaseWrapper firebase, ReduxBundle redux}) {
    _firebase = firebase ??
        CompletableFakeFirebaseWrapper(completer: _firebaseCompleter);
    _redux = redux ?? CompletableFakeReduxBundle(completer: _reduxCompleter);
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);
  }

  Widget get widget => _appWidget;

  void completeFirebase() => _firebaseCompleter.complete();
  void completeRedux() => _reduxCompleter.complete();
}
