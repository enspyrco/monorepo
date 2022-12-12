import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/home/home_screen.dart';
import 'app/home/services/file_selector_service.dart';
import 'app/home/services/parser_service.dart';
import 'app/state/app_state.dart';
import 'firebase_options.dart';

Future<void> astroInitialization() async {
  /// Setup FlutterFire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Setup Locator so plugins can add SystemChecks and configure the AppState
  Locator.add<SystemChecks>(DefaultSystemChecks());
  Locator.add<AppState>(AppState.initial);

  /// Setup navigation by adding a [PageGenerator] to the [Locator], that will be
  /// used to turn a [PageState] from [AppState.navigation.stack] into a [Page]
  /// that the [Navigator] will use to display a screen.
  Locator.add<PageGenerator>(DefaultPageGenerator());
  Locator.add<FileSelectorService>(FileSelectorService());
  Locator.add<ParserService>(ParserService());

  /// Perform individual plugin initialization
  initializeErrorHandling<AppState>();
  initializeAuthPlugin<AppState>(initialScreen: const HomeScreen());
  initializeAstroInspector<AppState>();
  initializeNavigationPlugin<AppState>();

  /// Create our MissionControl and add to the Locator
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: locate<AppState>(),
      errorHandlers: DefaultErrorHandlers<AppState>(),
      systemChecks: locate<SystemChecks>(),
      missionControlCtr: ParentingMissionControl.new));
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
                  locate<SendMissionReportsToInspector>().stream),
            ),
          ),
        Expanded(
          flex: 1,
          child: PagesNavigator<AppState>(
            onInit: (missionControl) =>
                missionControl.launch(const BindAuthState<AppState>()),
          ),
        ),
      ],
    );
  }
}
