import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/astro_annotations.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../organisations/models/organisations_state.dart';
import '../../projects/models/projects_state.dart';
import '../../projects/models/sections_state.dart';

part 'app_state.g.dart';

@astroState
abstract class AppState
    implements
        AstroState,
        AppStateNavigation,
        AppStateErrorHandling,
        AppStateAuth {
  OrganisationsState get organisations;
  ProjectsState get projects;
  SectionsState get sections;

  factory AppState.initialValue() => GeneratedAppState(
        projects: ProjectsState.initial,
        sections: SectionsState.initial,
        organisations: OrganisationsState.initial,
        navigation: DefaultNavigationState.initial,
        auth: AstroAuth.initialState(),
        error: DefaultErrorHandlingState.initial,
      );

  @override
  AppState copyWith({
    OrganisationsState? organisations,
    ProjectsState? projects,
    SectionsState? sections,
    NavigationState? navigation,
    ErrorHandlingState? error,
    AuthState? auth,
  });
}
