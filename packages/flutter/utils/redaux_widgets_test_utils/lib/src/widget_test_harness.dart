import 'package:flutter/material.dart' hide Action;
import 'package:redaux/redaux.dart';
import 'package:redaux_widgets/widgets/store_provider.dart';

import 'record_actions_endware.dart';

/// A test harness for wrapping a widget under test that provides the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
///
/// The `widget` getter returns the `widgetUnderTest` wrapped in a [Scaffold],
/// a [MaterialApp] and a [StoreProvider]. Other mini-widget-trees that would
/// be useful as wrappers around `widgetUnderTest` can easily be added as a getter.
///
/// The harness exposes Store.dispatchEvents so tests can observe dispatched
/// actions and the associated state change.
class WidgetTestHarness<T extends RootState> {
  WidgetTestHarness(
      {required T initialState, required Widget child, List<Endware>? endwares})
      : _widgetUnderTest = child {
    _store = Store<T>(
        state: initialState, endWares: [...?endwares, _actionsEndware]);
  }

  late final Store<T> _store;
  final Widget _widgetUnderTest;
  final _actionsEndware = RecordActionsEndware<T>();

  Widget get widget => StoreProvider<T>(
      store: _store,
      child: MaterialApp(home: Scaffold(body: _widgetUnderTest)));

  T get state => _store.state;

  List<Action> get dispatchedActions => _actionsEndware.actions;

  void dispatch(Action action) => _store.dispatch(action);
}
