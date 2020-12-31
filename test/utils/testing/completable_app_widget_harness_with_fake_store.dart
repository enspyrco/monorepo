import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/utils/redux_bundle.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';
import 'package:the_process/widgets/app_widget/app_widget.dart';

import '../../mocks/redux/fake_store.dart';
import '../../mocks/redux/redux_bundle_completable_fake.dart';
import '../../mocks/wrappers/firebase_wrapper_completable_fake.dart';

/// A test harness that wraps AppWidget to provide the
/// functionality that a test may want in order to interact with the widget,
/// including completing the firebase and redux futures that are awaited in the
/// AppWidget.
///
/// The harness also holds a [FakeStore], whose functionality can be accessed
/// through the harness.
class CompletableAppWidgetHarnessWithFakeStore {
  final _firebaseCompleter = Completer<FirebaseApp>();
  final _reduxCompleter = Completer<Store<AppState>>();

  final FakeStore _fakeStore;

  late final FirebaseWrapper _firebase;
  late final ReduxBundle _redux;
  late final AppWidget _appWidget;

  //{FakeStore store}
  CompletableAppWidgetHarnessWithFakeStore() : _fakeStore = FakeStore() {
    _firebase = FirebaseWrapperCompletableFake(completer: _firebaseCompleter);
    _redux = ReduxBundleCompletableFake(completer: _reduxCompleter);
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);
  }

  Widget get widget => _appWidget;

  void completeFirebase() => _firebaseCompleter.complete();
  void completeRedux() => _reduxCompleter.complete(_fakeStore);

  void updateAppState(dynamic Function(AppStateBuilder) updates) =>
      _fakeStore.updateState(updates);

  AppState get state => _fakeStore.state;

  List<ReduxAction> get receivedActions => _fakeStore.dispatchedActions;
}
