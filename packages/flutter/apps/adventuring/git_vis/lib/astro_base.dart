import 'package:astro/astro.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:flutter/material.dart';
import 'package:git_vis/app/missions/open_git_repository.dart';
import 'package:git_vis/visualisation/visualisation_screen.dart';

import 'app/state/app_state.dart';
import 'git/models/git_object_database.dart';
import 'git/services/git_service.dart';
import 'visualisation/visualisation_page_state.dart';

Future<void> astroInitialization() async {
  /// Setup Locator so plugins can add SystemChecks & Routes, configure the AppState, etc.
  Locator.add<SystemChecks>(DefaultSystemChecks());

  /// Add the initial routes to the PageGenerator
  Locator.add<PageGenerator>(
    DefaultPageGenerator()
      ..add(
        type: VisualisationPageState,
        generator: (state) => MaterialPage(
          child: VisualisationScreen(
            GitObjectDatabase('/Users/nick/git/orgs/enspyrco/monorepo'),
          ),
        ),
      ),
  );

  /// Start with the desired routes in the navigation stack
  Locator.add<AppState>(
    AppState.initial.copyWith(
      navigation:
          const DefaultNavigationState(stack: [VisualisationPageState()]),
    ),
  );
  Locator.add<GitService>(GitService());

  /// Perform individual plugin initialization.
  initializeErrorHandling<AppState>();
  initializeAstroInspector<AppState>();
  initializeNavigationPlugin<AppState>();

  /// Finally, create our MissionControl and add to the Locator.
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
            onInit: (missionControl) => missionControl.launch(
                const OpenGitRepository(
                    at: '/Users/nick/git/orgs/enspyrco/monorepo')),
          ),
        ),
      ],
    );
  }
}
