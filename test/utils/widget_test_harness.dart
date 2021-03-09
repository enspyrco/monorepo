import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

import '../mocks/redux/fake_store.dart';

/// A test harness to wrap a widget under test and provide all the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
class WidgetTestHarness {
  final FakeStore _fakeStore;
  final Widget _widgetUnderTest;

  WidgetTestHarness({required Widget widgetUnderTest, FakeStore? fakeStore})
      : _fakeStore = fakeStore ?? FakeStore(),
        _widgetUnderTest = widgetUnderTest;

  Widget get widget => StoreProvider<AppState>(
      store: _fakeStore,
      child: MaterialApp(home: Scaffold(body: _widgetUnderTest)));

  AppState get state => _fakeStore.state;

  void updateAppState(AppState state) => _fakeStore.updateState(state);

  List<ReduxAction> get receivedActions => _fakeStore.dispatchedActions;
}
