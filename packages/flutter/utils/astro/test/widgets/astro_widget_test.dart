import 'package:astro/astro.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test-doubles/example_app_state.dart';
import '../test-doubles/identity_equivalence_app_state.dart';
import '../test-doubles/missions/add_error_report.dart';
import '../test-doubles/missions/new_object_same_state.dart';

void main() {
  testWidgets('OnStateChangeBuilder only builds when state changes',
      (tester) async {
    // Setup objects under test & test doubles
    var appState = ExampleAppState.initial;
    var missionControl = DefaultMissionControl(state: appState);

    Locator.add<MissionControl<ExampleAppState>>(missionControl);

    int i = 0;
    final widget = MaterialApp(
        home: OnStateChangeBuilder<ExampleAppState, List<ErrorReport>>(
            transformer: (state) => state.error.reports,
            builder: (context, vm) {
              return Text('builds: ${i++}, reports: ${vm.length}');
            }));

    await tester.pumpWidget(widget);

    expect(find.text('builds: 0, reports: 0'), findsOneWidget);

    missionControl.land(AddErrorReport<ExampleAppState>());
    await tester.pump();

    expect(find.text('builds: 1, reports: 1'), findsOneWidget);

    missionControl.land(NewObjectSameState<ExampleAppState>());
    await tester.pump();

    expect(find.text('builds: 1, reports: 1'), findsOneWidget);

    missionControl.land(AddErrorReport<ExampleAppState>());
    // notes on why we add a duration are below
    await tester.pump(const Duration(microseconds: 1));
    expect(find.text('builds: 2, reports: 2'), findsOneWidget);
  });

  testWidgets(
      'OnStateChangeBuilder only builds when state changes (with identity equivalence)',
      (tester) async {
    // Setup objects under test & test doubles
    var appState = IdentityEquivalenceAppState.initial;
    var missionControl = DefaultMissionControl(state: appState);

    Locator.add<MissionControl<IdentityEquivalenceAppState>>(missionControl);

    int i = 0;
    final widget = MaterialApp(
        home: OnStateChangeBuilder<IdentityEquivalenceAppState,
                List<ErrorReport>>(
            transformer: (state) => state.error.reports,
            builder: (context, vm) {
              return Text('builds: ${i++}, reports: ${vm.length}');
            }));

    await tester.pumpWidget(widget);

    expect(find.text('builds: 0, reports: 0'), findsOneWidget);

    missionControl.land(AddErrorReport<IdentityEquivalenceAppState>());
    await tester.pump();

    expect(find.text('builds: 1, reports: 1'), findsOneWidget);

    missionControl.land(NewObjectSameState<IdentityEquivalenceAppState>());
    await tester.pump();

    expect(find.text('builds: 1, reports: 1'), findsOneWidget);

    missionControl.land(AddErrorReport<IdentityEquivalenceAppState>());
    // notes on why we add a duration are below
    await tester.pump(const Duration(microseconds: 1));
    expect(find.text('builds: 2, reports: 2'), findsOneWidget);
  });
}

// ** why we add a duration 
// adding a duration here does an extra microtask flush,  we can also call
// pump() twice, not sure why we need two flushes though, I guess the stream
// is behind?
