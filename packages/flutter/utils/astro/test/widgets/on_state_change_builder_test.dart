/// The test below was moved over from our_meals 
/// 
/// This is a good test but as it's currently setup we need plugins to setup
/// an app then check if the result matches expectations
/// 
/// TODO: Try to do this test in astro without the plugins and if it's not 
/// possible consider making a new package that depdends on astro and plugins
/// whose purpose is to test the core astro functionality 

// void main() {
//   testWidgets('OnStateChangeBuilder only builds when state changes',
//       (tester) async {
//     // Setup objects under test & test doubles
//     var appState = ExampleAppState.initial;
//     var missionControl = RecordingMissionControl(state: appState);

//     Locator.add<MissionControl<ExampleAppState>>(missionControl);

//     int i = 0;
//     final widget = MaterialApp(
//         home: OnStateChangeBuilder<ExampleAppState, SignedInState>(
//             transformer: (state) {
//       var signedIn = (state as dynamic).auth.user.signedIn as SignedInState;
//       return signedIn;
//     }, builder: (context, signedInState) {
//       var output = 'builds: ${i++}, $signedInState';
//       return Text(output);
//     }));

//     await tester.pumpWidget(widget);

//     expect(find.text('builds: 0, SignedInState.checking'), findsOneWidget);

//     missionControl.land(const PushRoute<ExampleAppState>(SignInPageState()));
//     await tester.pump();

//     expect(find.text('builds: 1, SignedInState.checking'), findsOneWidget);

//     missionControl.land(const PushRoute<ExampleAppState>(HomePageState()));
//     await tester.pump();

//     expect(find.text('builds: 1, reports: 1'), findsOneWidget);

//     missionControl.land(const PushRoute<ExampleAppState>(HomePageState()));
//     // notes on why we add a duration are below
//     await tester.pump(const Duration(microseconds: 1));
//     expect(find.text('builds: 2, reports: 2'), findsOneWidget);
//   });
// }
