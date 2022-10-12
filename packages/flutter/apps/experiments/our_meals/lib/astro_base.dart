import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/material.dart';
import 'package:our_meals/home/home_screen.dart';
import 'package:our_meals/pages_navigator.dart';

import 'app/state/app_state.dart';
import 'routes/home_page_state.dart';

void initializeAstro() {
  var initialState = AppState.initial
      .copyWith(navigation: NavigationState(stack: [AuthCheckPageState()]));
  final sendMissionUpdates = SendMissionUpdatesToInspector<AppState>();
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: initialState, systemChecks: [sendMissionUpdates]));
  Locator.add<SendMissionUpdatesToInspector>(sendMissionUpdates);

  Locator.add<PageGenerator>(PageGenerator({
    SignInPageState: (state) => const MaterialPage(child: SignInScreen()),
    HomePageState: (state) => const MaterialPage(child: HomeScreen()),
    AuthCheckPageState: (state) => MaterialPage(
        child: AuthCheckScreen<AppState>(homePageState: HomePageState())),
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
