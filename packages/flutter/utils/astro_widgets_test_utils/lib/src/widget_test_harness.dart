import 'package:astro/astro.dart';
import 'package:astro_widgets/widgets/store_provider.dart';
import 'package:flutter/material.dart';

import 'record_missions.dart';

/// A test harness for wrapping a widget under test that provides the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
///
/// The `widget` getter returns the `widgetUnderTest` wrapped in a [Scaffold],
/// a [MaterialApp] and a [StoreProvider]. Other mini-widget-trees that would
/// be useful as wrappers around `widgetUnderTest` can easily be added as a getter.
///
/// The harness exposes [MissionControl.onDispatch] so tests can observe started
/// missions and any associated state change.
class WidgetTestHarness<T extends RootState> {
  WidgetTestHarness(
      {required T initialState,
      required Widget child,
      List<SystemCheck>? systemChecks})
      : _widgetUnderTest = child {
    _store = MissionControl<T>(
        state: initialState, systemChecks: [...?systemChecks, _recorded]);
  }

  late final MissionControl<T> _store;
  final Widget _widgetUnderTest;
  final _recorded = RecordMissions<T>();

  Widget get widget => StoreProvider<T>(
      store: _store,
      child: MaterialApp(home: Scaffold(body: _widgetUnderTest)));

  T get state => _store.state;

  List<Mission> get recordedMissions => _recorded.missions;

  void launch(AwayMission<T> mission) => _store.launch(mission);
  void land(DockingMission<T> mission) => _store.land(mission);
}
