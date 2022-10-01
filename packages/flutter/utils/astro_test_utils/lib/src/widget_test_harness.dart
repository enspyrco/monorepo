import 'package:astro/core/mission.dart';
import 'package:astro/core/mission_control.dart';
import 'package:astro/core/system_check.dart';
import 'package:astro/widgets/mission_control_provider.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:flutter/material.dart';

import 'system-checks/record_missions.dart';

/// A test harness for wrapping a widget under test that provides the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
///
/// The `widget` getter returns the `widgetUnderTest` wrapped in a [Scaffold],
/// a [MaterialApp] and a [MissionControlProvider]. Other mini-widget-trees that would
/// be useful as wrappers around `widgetUnderTest` can easily be added as a getter.
///
/// The harness exposes [MissionControl.stream] so tests can observe started
/// missions and any associated state change.
class WidgetTestHarness<T extends AstroState> {
  WidgetTestHarness(
      {required T initialState,
      required Widget child,
      List<SystemCheck>? systemChecks})
      : _widgetUnderTest = child {
    _missionControl = MissionControl<T>(
        state: initialState, systemChecks: [...?systemChecks, _recorded]);
  }

  late final MissionControl<T> _missionControl;
  final Widget _widgetUnderTest;
  final _recorded = RecordMissions<T>();

  Widget get widget => MissionControlProvider<T>(
      missionControl: _missionControl,
      child: MaterialApp(home: Scaffold(body: _widgetUnderTest)));

  T get state => _missionControl.state;

  List<Mission> get recordedMissions => _recorded.missions;

  void launch(AwayMission<T> mission) => _missionControl.launch(mission);
  void land(LandingMission<T> mission) => _missionControl.land(mission);
}
