import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/material.dart';

import 'app/state/app_state.dart';
import 'pages_navigator.dart';

void initializeAstro() {
  final sendMissionUpdates = SendMissionUpdatesToInspector<AppState>();
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: AppState.initial, systemChecks: [sendMissionUpdates]));
  Locator.add<SendMissionUpdatesToInspector>(sendMissionUpdates);

  astroAuthInit();
}

class AstroBase extends StatelessWidget {
  const AstroBase({required Widget child, Key? key}) : super(key: key);

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
