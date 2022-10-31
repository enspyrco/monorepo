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

  ///
  var initialState = AppState.initial.copyWith(
      navigation: const NavigationState(stack: [AuthGatePageState()]));

  var systemChecks = <SystemCheck>[];

  if (const bool.fromEnvironment('IN-APP-ASTRO-INSPECTOR')) {
    /// Create a SystemCheck that sends mission updates to the Inspector
    final sendMissionUpdates = SendMissionUpdatesToInspector<AppState>();
    Locator.add<SendMissionUpdatesToInspector>(sendMissionUpdates);
    systemChecks.add(sendMissionUpdates);
  }

  /// Create our MissionControl and add to the Locator
  Locator.add<MissionControl<AppState>>(DefaultMissionControl<AppState>(
      state: initialState,
      errorHandlers: DefaultErrorHandlers<AppState>(),
      systemChecks: systemChecks,
      missionControlCtr: ParentingMissionControl.new));
  Locator.add<FirestoreService>(FirestoreServiceFlutterfire());

  /// Setup navigation by adding a [PageGenerator] to the [Locator], that will be
  /// used to turn a [PageState] from [AppState.navigation.stack] into a [Page]
  /// that the [Navigator] will use to display a screen.
  Locator.add<PageGenerator>(PageGenerator({
    AuthGatePageState: (state) => const MaterialPage(
        key: ValueKey(AuthGatePageState),
        child: AuthGateScreen<AppState>(child: HomeScreen())),
    ErrorReportPageState: (state) => MaterialPage(
        key: const ValueKey(ErrorReportPageState),
        child: ErrorReportScreen<AppState>(
            (state as ErrorReportPageState).report)),
    ManageOrganisationsPageState: (state) => MaterialPage(
        key: const ValueKey(ManageOrganisationsPageState),
        child:
            ManageOrganisationsScreen(state as ManageOrganisationsPageState)),
    ProjectDetailsPageState: (state) => MaterialPage(
        key: const ValueKey(ProjectDetailsPageState),
        child: ProjectDetailsScreen(state as ProjectDetailsPageState)),
  }));

  /// Perform individual plugin initialization
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
                missionControl.launch(const BindAuthState<AppState>()),
          ),
        ),
      ],
    );
  }
}
