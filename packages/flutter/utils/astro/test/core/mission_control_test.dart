import 'package:astro/core/mission_control.dart';
import 'package:test/test.dart';

import '../test-doubles/example_app_state.dart';
import '../test-doubles/example_away_mission.dart';
import '../test-doubles/example_landing_mission.dart';

void main() {
  test('MissionControl handles errors when landing missions', () {
    // Setup objects under test & test doubles
    var appState = ExampleAppState.initial;
    var missionControl = MissionControl(state: appState);
    var mission = ExampleLandingMission();

    // Check there are no error messages before we start
    expect(appState.errorMessages, isEmpty);

    // Set an expectation that MissionControl will emit an app state with an error message
    expect(
        missionControl.onStateChange,
        emits(predicate<ExampleAppState>(
            (appState) => appState.errorMessages.isNotEmpty)));

    // Land the mission
    missionControl.land(mission);
  });

  test('MissionControl handles errors when launching missions', () {
    // Setup objects under test & test doubles
    var appState = ExampleAppState.initial;
    var missionControl = MissionControl(state: appState);
    var mission = ExampleAwayMission();

    // Check there are no error messages before we start
    expect(appState.errorMessages, isEmpty);

    // Set an expectation that MissionControl will emit an app state with an error message
    expect(
        missionControl.onStateChange,
        emits(predicate<ExampleAppState>(
            (appState) => appState.errorMessages.isNotEmpty)));

    // Launch the mission
    missionControl.launch(mission);
  });
}
