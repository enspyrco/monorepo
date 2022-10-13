import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:flutter/material.dart';
import 'package:our_meals/home/home_screen.dart';

import 'app/state/app_state.dart';

void initializeAstro() {
  var initialState = AppState.initial
      .copyWith(navigation: NavigationState(stack: [AuthGatePageState()]));
  final sendMissionUpdates = SendMissionUpdatesToInspector<AppState>();
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: initialState, systemChecks: [sendMissionUpdates]));
  Locator.add<SendMissionUpdatesToInspector>(sendMissionUpdates);

  Locator.add<PageGenerator>(PageGenerator({
    AuthGatePageState: (state) => const MaterialPage(
        child: AuthGateScreen<AppState>(child: HomeScreen())),
  }));

  astroAuthInit();
}

class AstroBase extends StatelessWidget {
  const AstroBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Row(
        children: [
          if (const bool.fromEnvironment('IN-APP-ASTRO-INSPECTOR'))
            Expanded(
              flex: 1,
              child: Material(
                child: AstroInspectorScreen(
                    locate<SendMissionUpdatesToInspector>().stream),
              ),
            ),
          const Expanded(
            flex: 1,
            child: PagesNavigator(),
          ),
        ],
      ),
    );
  }
}

/// An [OnStateChangeBuilder] that updates the [Navigator] whenever [AppState.pages]
/// changes.
class PagesNavigator extends StatelessWidget {
  const PagesNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, List<PageState>>(
        onInit: (missionControl) =>
            missionControl.launch(BindAuthState<AppState>()),
        transformer: (state) => state.navigation.stack,
        builder: (context, stack) {
          var generator = locate<PageGenerator>();
          return Navigator(
              pages: [
                for (var pageState in stack) generator.applyTo(pageState)
              ],
              onPopPage: (route, dynamic result) {
                if (!route.didPop(result)) {
                  return false;
                }

                if (route.isCurrent) {
                  locate<MissionControl<AppState>>().land(RemoveCurrentRoute());
                }

                return true;
              });
        });
  }
}
