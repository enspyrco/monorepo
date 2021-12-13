import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../test-doubles/redux/fake_store.dart';

/// A test harness to wrap a widget under test and provide all the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
///
/// Currently, calling .receivedActions when [_store] is not a [FakeStore] is
/// a runtime error - I think we can do better.
class WidgetTestHarness<T extends RedFireState> {
  final Store<T> _store;
  final Widget _widgetUnderTest;

  WidgetTestHarness.withFakeStore(
      {required T initialState, required Widget widgetUnderTest})
      : _store = FakeStore(initialState),
        _widgetUnderTest = widgetUnderTest;

  WidgetTestHarness.withStore(
      {required Store<T> initializedStore, required Widget widgetUnderTest})
      : _store = initializedStore,
        _widgetUnderTest = widgetUnderTest;

  Widget get widget => StoreProvider<T>(
      store: _store,
      child: MaterialApp(home: Scaffold(body: _widgetUnderTest)));

  T get state => _store.state;

  List<ReduxAction> get receivedActions {
    if (_store is! FakeStore) {
      throw Exception(
          'You tried to access `dispatched` on a real `Store`. \n\n Use `WidgetTestHarness.withFakeStore` if you want to access `dispatchedActions`.');
    }
    return (_store as FakeStore).dispatched;
  }
}
