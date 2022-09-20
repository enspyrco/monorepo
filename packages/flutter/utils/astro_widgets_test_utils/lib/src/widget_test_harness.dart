import 'package:flutter/material.dart' hide Action;
import 'package:astro/astro.dart';
import 'package:astro_widgets/widgets/store_provider.dart';

import 'record_actions.dart';

/// A test harness for wrapping a widget under test that provides the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
///
/// The `widget` getter returns the `widgetUnderTest` wrapped in a [Scaffold],
/// a [MaterialApp] and a [StoreProvider]. Other mini-widget-trees that would
/// be useful as wrappers around `widgetUnderTest` can easily be added as a getter.
///
/// The harness exposes [Store.onDispatch] so tests can observe dispatched
/// actions and the associated state change.
class WidgetTestHarness<T extends RootState> {
  WidgetTestHarness(
      {required T initialState,
      required Widget child,
      List<SystemCheck>? systemChecks})
      : _widgetUnderTest = child {
    _store = Store<T>(
        state: initialState, systemChecks: [...?systemChecks, _recorded]);
  }

  late final Store<T> _store;
  final Widget _widgetUnderTest;
  final _recorded = RecordActions<T>();

  Widget get widget => StoreProvider<T>(
      store: _store,
      child: MaterialApp(home: Scaffold(body: _widgetUnderTest)));

  T get state => _store.state;

  List<Action> get recordedActions => _recorded.actions;

  void launch(AsyncAction<T> action) => _store.launch(action);
  void land(SyncAction<T> action) => _store.land(action);
}
