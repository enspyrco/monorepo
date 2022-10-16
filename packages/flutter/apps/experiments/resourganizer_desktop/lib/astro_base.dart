import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/material.dart';

import 'app/state/app_state.dart';
import 'example_drop_target.dart';

void initializeAstro() {
  var initialState = AppState.initial
      .copyWith(navigation: NavigationState(stack: [AuthGatePageState()]));
  final sendMissionUpdates = SendMissionUpdatesToInspector<AppState>();
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: initialState, systemChecks: [sendMissionUpdates]));
  Locator.add<SendMissionUpdatesToInspector>(sendMissionUpdates);

  Locator.add<PageGenerator>(PageGenerator({
    AuthGatePageState: (state) => const MaterialPage(
        child: AuthGateScreen<AppState>(child: ExampleDragTarget())),
    ErrorReportPageState: (state) => MaterialPage(
        child: ErrorReportScreen<AppState>(
            (state as ErrorReportPageState).report)),
  }));

  astroAuthInit();
}

class AstroBase extends StatelessWidget {
  const AstroBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (const bool.fromEnvironment('IN-APP-ASTRO-INSPECTOR'))
          Expanded(
            flex: 1,
            child: Material(
              child: AstroInspectorScreen(
                  locate<SendMissionUpdatesToInspector>().stream),
            ),
          ),
        Expanded(
          flex: 1,
          child: PagesNavigator<AppState>(
            onInit: (missionControl) =>
                missionControl.launch(BindAuthState<AppState>()),
          ),
        ),
      ],
    );
  }
}
