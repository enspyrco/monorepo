import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/utils/redux_bundle.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';
import 'package:the_process/widgets/app_widget/app_widget.dart';

import '../../mocks/redux/fake_redux_bundle.dart';
import '../../mocks/wrappers/fake_firebase_wrapper.dart';

/// A test harness to wrap the widget under test, (in this case the
/// AppWidget), and provide all the functionality
/// that a test may want in order to interact with the widget.
///
/// In this case, the firebase and redux futures that are awaited in the
/// AppWidget have already been completed.
class AppWidgetHarness {
  FirebaseWrapper _firebase;
  ReduxBundle _redux;
  AppWidget _appWidget;

  AppWidgetHarness({Store<AppState> store}) {
    _firebase = FakeFirebaseWrapper();
    _redux = FakeReduxBundle(store: store);
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);
  }

  Widget get widget => _appWidget;
}
