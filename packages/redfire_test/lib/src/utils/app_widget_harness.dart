import 'package:flutter/material.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/redfire.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:redux/redux.dart';

import '../../redfire_test.dart';

/// A test harness to wrap the widget under test, (in this case the
/// AppWidget), and provide all the functionality
/// that a test may want in order to interact with the widget.
///
class AppWidgetHarness<T extends RedFireState> {
  final Store<T> _store;
  final FirebaseWrapper _firebase;
  late final AppWidget _appWidget;

  /// Expects an [initialState], which is used to create a [FakeStore],
  /// which is then used to create the [AppWidget].
  AppWidgetHarness.withFakeStore({required T initialState})
      : _store = FakeStore(initialState),
        _firebase = FakeFirebaseWrapper() {
    _appWidget = AppWidget.fromStore(
      mainPage: const EmptyMainPage(),
      initializedStore: _store,
      firebaseWrapper: FakeFirebaseWrapper(),
      pageTransforms: const [],
    );
  }

  /// Expects a [Store] that has already been initialized, which is used to
  /// create the [AppWidget].
  AppWidgetHarness.withStore({
    required Store<T> initializedStore,
    List<ReduxAction>? initialActions,
    FirebaseWrapper? firebaseWrapper,
  })  : _store = initializedStore,
        _firebase = firebaseWrapper ?? FakeFirebaseWrapper() {
    _appWidget = AppWidget.fromStore(
      mainPage: const EmptyMainPage(),
      initializedStore: _store,
      firebaseWrapper: _firebase,
      pageTransforms: const [],
    );
  }

  /// Provides the services and their mock plugins to the Locator.
  /// Also creates a store, initialized with default reducers/middleware and
  /// dispatches the default actions.
  AppWidgetHarness.withMockedPlugins(T initialState, ServicesHarness services)
      : _firebase = FakeFirebaseWrapper(),
        _store = Store<T>(redfireReducers<T>().combine(),
            initialState: initialState, middleware: redfireMiddlewares()) {
    RedFireLocator.provide(
        authService: services.auth,
        databaseService: services.database,
        platformService: services.platform);
    _appWidget = AppWidget.fromStore(
      mainPage: const EmptyMainPage(),
      initializedStore: _store,
      firebaseWrapper: _firebase,
      pageTransforms: const [],
    );
    for (var action in redfireInitialActions) {
      _store.dispatch(action);
    }
  }

  Widget get widget => _appWidget;
}
