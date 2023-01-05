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
import 'home/home_screen.dart';
import 'organisations/routes/manage_organisations_page_state.dart';
import 'organisations/routes/manage_organisations_screen.dart';
import 'projects/routes/project_details/project_details_page_state.dart';
import 'projects/routes/project_details/project_details_screen.dart';

Future<void> astroInitialization() async {
  /// Setup FlutterFire
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Setup Locator so plugins can add SystemChecks & Routes, configure the AppState, etc.
  Locator.add<SystemChecks>(DefaultSystemChecks());
  Locator.add<PageGenerator>(DefaultPageGenerator());
  Locator.add<AppState>(AppState.initialValue());

  /// Perform any final initialization by the app such as setting up routes.
  initializeTheProcess();

  /// Finally, create our MissionControl and add to the Locator.
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: locate<AppState>(),
      errorHandlers: DefaultErrorHandlers<AppState>(),
      systemChecks: locate<SystemChecks>(),
      missionControlCtr: ParentingMissionControl.new));
}

void initializeTheProcess() {
  /// Perform individual plugin initialization.
  initializeErrorHandling<AppState>();
  initializeAuthPlugin<AppState>(initialScreen: const HomeScreen());
  initializeAstroInspector<AppState>();
  initializeNavigationPlugin<AppState>();

  /// Add services used in away missions.
  Locator.add<FirestoreService>(FirestoreServiceFlutterfire());

  /// Add page generators for [ManageOrganisations] & [ProjectDetails].
  /// The page generators are applied when a PageState is found in
  /// [AppState.navigation.stack], turning a PageState into a Page, which
  /// the Navigator turns into a Route, that includes the Screen we use when
  /// composing the PageState (see examples below).
  final generator = locate<PageGenerator>();
  generator.add(
    type: ManageOrganisationsPageState,
    generator: (state) => MaterialPage(
      key: const ValueKey(ManageOrganisationsPageState),
      child: ManageOrganisationsScreen(state as ManageOrganisationsPageState),
    ),
  );
  generator.add(
    type: ProjectDetailsPageState,
    generator: (state) => MaterialPage(
      key: const ValueKey(ProjectDetailsPageState),
      child: ProjectDetailsScreen(state as ProjectDetailsPageState),
    ),
  );
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
