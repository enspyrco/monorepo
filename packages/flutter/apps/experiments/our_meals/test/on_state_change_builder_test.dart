import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:our_meals/app/state/app_state.dart';
import 'package:our_meals/routes/home_page_state.dart';

void main() {
  testWidgets('OnStateChangeBuilder only builds when state changes',
      (tester) async {
    // Setup objects under test & test doubles
    var appState = AppState.initial;
    var missionControl = DefaultMissionControl(state: appState);

    Locator.add<MissionControl<AppState>>(missionControl);

    int i = 0;
    final widget = MaterialApp(
        home:
            OnStateChangeBuilder<AppState, SignedInState>(transformer: (state) {
      var signedIn = (state as dynamic).user.signedIn as SignedInState;
      return signedIn;
    }, builder: (context, signedInState) {
      return Text('builds: ${i++}, $signedInState');
    }));

    await tester.pumpWidget(widget);

    expect(find.text('builds: 0, SignedInState.checking'), findsOneWidget);

    missionControl.land(const PushRoute<AppState>(SignInPageState()));
    await tester.pump();

    expect(find.text('builds: 1, SignedInState.checking'), findsOneWidget);

    missionControl.land(const PushRoute<AppState>(HomePageState()));
    await tester.pump();

    expect(find.text('builds: 1, reports: 1'), findsOneWidget);

    missionControl.land(const PushRoute<AppState>(HomePageState()));
    // notes on why we add a duration are below
    await tester.pump(const Duration(microseconds: 1));
    expect(find.text('builds: 2, reports: 2'), findsOneWidget);
  });
}
