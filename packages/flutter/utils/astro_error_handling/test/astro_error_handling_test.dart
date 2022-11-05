/// TODO: Adapt the following tests to test DefaultErrorHandlers
/// 
/// The tests below are copied from astro > mission_control_test.dart
/// Since MissionControl changed to just rethrowing by default unless the 
/// DefaultErrorHandlers are injected into DefaultMissionControl, these tests
/// no longer worked but should work if we inject the DefaultErrorHandlers into
/// the DefaultMissionControl.

// void main() {
//   test('DefaultErrorHandlers handle errors when landing missions', () {
//     // Setup objects under test & test doubles
//     var appState = ExampleAppState.initial;
//     var missionControl = DefaultMissionControl(state: appState);
//     var mission = ThrowingLandingMission<ExampleAppState>();

//     // Check there are no error messages before we start
//     expect(appState.error.reports, isEmpty);

//     // Set an expectation that MissionControl will emit an app state with an error message
//     expect(
//         missionControl.onStateChange,
//         emits(predicate<ExampleAppState>(
//             (appState) => appState.error.reports.isNotEmpty)));

//     // Land the mission
//     missionControl.land(mission);
//   });

//   test('DefaultErrorHandlers handles errors when launching missions', () {
//     // Setup objects under test & test doubles
//     var appState = ExampleAppState.initial;
//     var missionControl = DefaultMissionControl(state: appState);
//     var mission = ExampleAwayMission<ExampleAppState>();

//     // Check there are no error messages before we start
//     expect(appState.error.reports, isEmpty);

//     // Set an expectation that MissionControl will emit an app state with an error message
//     expect(
//         missionControl.onStateChange,
//         emits(predicate<ExampleAppState>(
//             (appState) => appState.error.reports.isNotEmpty)));

//     // Launch the mission
//     missionControl.launch(mission);
//   });
// }
