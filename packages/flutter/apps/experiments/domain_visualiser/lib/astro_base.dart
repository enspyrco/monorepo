import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_service_flutterfire/firestore_service_flutterfire.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:flutter/material.dart';

import 'app/state/app_state.dart';
import 'firebase_options.dart';
import 'widgets/drawing_page.dart';

Future<void> astroInitialization() async {
  /// Setup FlutterFire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Setup Locator so plugins can add SystemChecks & Routes, configure the AppState, etc.
  Locator.add<SystemChecks>(DefaultSystemChecks());
  Locator.add<PageGenerator>(DefaultPageGenerator());
  Locator.add<AppState>(AppState.initial);

  /// Perform any final initialization by the app such as setting up routes.
  initializeDomainVisualizer();

  /// Finally, create our MissionControl and add to the Locator.
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: locate<AppState>(),
      errorHandlers: DefaultErrorHandlers<AppState>(),
      systemChecks: locate<SystemChecks>(),
      missionControlCtr: ParentingMissionControl.new));
}

void initializeDomainVisualizer() {
  /// Perform individual plugin initialization.
  initializeErrorHandling<AppState>();
  initializeAuthPlugin<AppState>(initialScreen: const DrawingPage());
  initializeAstroInspector<AppState>();
  initializeNavigationPlugin<AppState>();

  /// Add services used in away missions.
  Locator.add<FirestoreService>(FirestoreServiceFlutterfire());
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
