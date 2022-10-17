import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/state/app_state.dart';
import 'firebase_options.dart';
import 'home/home_screen.dart';

Future<void> astroInitialization() async {
  /// Setup FlutterFire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// MissionControl, AppState & SystemChecks
  var initialState = AppState.initial
      .copyWith(navigation: NavigationState(stack: [AuthGatePageState()]));
  final sendMissionUpdates = SendMissionUpdatesToInspector<AppState>();
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: initialState, systemChecks: [sendMissionUpdates]));
  Locator.add<SendMissionUpdatesToInspector>(sendMissionUpdates);

  /// Navigation
  Locator.add<PageGenerator>(PageGenerator({
    AuthGatePageState: (state) => const MaterialPage(
        child: AuthGateScreen<AppState>(child: HomeScreen())),
    ErrorReportPageState: (state) => MaterialPage(
        child: ErrorReportScreen<AppState>(
            (state as ErrorReportPageState).report)),
  }));

  /// Individual plugin initialization
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
