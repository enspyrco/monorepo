import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/utils/redux_bundle.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';
import 'package:the_process/widgets/app_widget/app_widget.dart';

import '../../mocks/redux/redux_bundle_fake.dart';
import '../../mocks/wrappers/firebase_wrapper_fake.dart';

/// A test harness to wrap the widget under test, (in this case the
/// AppWidget), and provide all the functionality
/// that a test may want in order to interact with the widget.
///
/// In this case, the firebase and redux futures that are awaited in the
/// AppWidget have already been completed.
class AppWidgetHarness {
  final FirebaseWrapper _firebase;
  final ReduxBundle _redux;
  late final AppWidget _appWidget;

  // The fake redux bundle just provides the given store to the AppWidget,
  // when the AppWidget calls _redux.createStore()
  AppWidgetHarness({required Store<AppState> store})
      : _firebase = FirebaseWrapperFake(),
        _redux = ReduxBundleFake(store: store) {
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);
  }

  Widget get widget => _appWidget;
}
