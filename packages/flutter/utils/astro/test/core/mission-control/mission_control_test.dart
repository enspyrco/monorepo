import 'package:astro/src/core/mission_control.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:test/test.dart';

import '../../test-doubles/example_app_state.dart';
import '../../test-doubles/missions/add_error_report.dart';
import '../../test-doubles/missions/example_away_mission.dart';
import '../../test-doubles/missions/new_object_same_state.dart';
import '../../test-doubles/missions/throwing_landing_mission.dart';

void main() {
  test('MissionControl handles errors when landing missions', () {
    // Setup objects under test & test doubles
    var appState = ExampleAppState.initial;
    var missionControl = DefaultMissionControl(state: appState);
    var mission = ThrowingLandingMission<ExampleAppState>();

    // Check there are no error messages before we start
    expect(appState.error.reports, isEmpty);

    // Set an expectation that MissionControl will emit an app state with an error message
    expect(
        missionControl.onStateChange,
        emits(predicate<ExampleAppState>(
            (appState) => appState.error.reports.isNotEmpty)));

    // Land the mission
    missionControl.land(mission);
  });

  test('MissionControl handles errors when launching missions', () {
    // Setup objects under test & test doubles
    var appState = ExampleAppState.initial;
    var missionControl = DefaultMissionControl(state: appState);
    var mission = ExampleAwayMission<ExampleAppState>();

    // Check there are no error messages before we start
    expect(appState.error.reports, isEmpty);

    // Set an expectation that MissionControl will emit an app state with an error message
    expect(
        missionControl.onStateChange,
        emits(predicate<ExampleAppState>(
            (appState) => appState.error.reports.isNotEmpty)));

    // Launch the mission
    missionControl.launch(mission);
  });

  test('MissionControl emits onStateChange events only when state changes', () {
    // Setup objects under test & test doubles
    var appState = ExampleAppState.initial;
    var missionControl = DefaultMissionControl(state: appState);

    // Check there are no error messages before we start
    expect(appState.error.reports, isEmpty);

    // We expect that MissionControl will emit app states with the relevant error reports
    expect(
        missionControl.onStateChange,
        emitsInOrder([
          ExampleAppState(
              error: const ErrorHandlingState(
                  reports: [ErrorReport(message: 'message')])),
          ExampleAppState(
              error: const ErrorHandlingState(
                  reports: [ErrorReport(message: 'message')])),
          ExampleAppState(
              error: const ErrorHandlingState(reports: [
            ErrorReport(message: 'message'),
            ErrorReport(message: 'message')
          ]))
        ]));

    // Launch the mission
    missionControl.land(AddErrorReport());
    missionControl.land(NewObjectSameState());
    missionControl.land(AddErrorReport());
  });
}
