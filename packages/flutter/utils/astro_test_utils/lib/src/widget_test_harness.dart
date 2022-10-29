import 'package:astro/astro.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import 'system-checks/record_missions.dart';

/// A test harness for wrapping a widget under test that provides the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
///
/// The `widget` getter returns the `child` wrapped in a [Scaffold] then
/// a [MaterialApp] then a [MissionControlProvider].
///
/// We will continue to extend the class with more getters for different
/// mini-widget-trees that will be useful as wrappers around `child`.
///
/// The harness creates a [MissionControl] and by default adds it to the
/// [Locator]. Passing `addToLocator : false` will stop this behaviour.
///
/// The harness exposes [MissionControl.stream] so tests can observe started
/// missions and any associated state change.
class WidgetTestHarness<T extends AstroState> {
  WidgetTestHarness({
    required T initialState,
    required Widget child,
    List<SystemCheck>? systemChecks,
    bool addToLocator = true,
  }) : _widgetUnderTest = child {
    _missionControl = DefaultMissionControl<T>(
        state: initialState, systemChecks: [...?systemChecks, _recorded]);
    if (addToLocator) Locator.add<MissionControl<T>>(_missionControl);
  }

  late final MissionControl<T> _missionControl;
  final Widget _widgetUnderTest;
  final _recorded = RecordMissions<T>();

  Widget get widget => MaterialApp(home: Scaffold(body: _widgetUnderTest));

  T get state => _missionControl.state;

  List<Mission> get recordedMissions => _recorded.missions;

  void launch(AwayMission<T> mission) => _missionControl.launch(mission);
  void land(LandingMission<T> mission) => _missionControl.land(mission);
}
