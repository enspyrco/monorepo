import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../organisations/models/organisations_state.dart';
import '../../projects/models/projects_state.dart';
import '../../projects/models/sections_state.dart';
import '../../teams/models/team_member.dart';

@immutable
class AppState
    implements
        AstroState,
        DefaultNavigationState,
        DefaultErrorHandlingState,
        DefaultAuthState {
  const AppState({
    required this.navigation,
    required this.auth,
    required this.error,
    required this.organisations,
    required this.projects,
    required this.sections,
    this.teamMember,
  });

  @override
  final NavigationState navigation;

  @override
  final AuthState auth;

  @override
  final ErrorHandlingState error;

  /// Organisations
  final OrganisationsState organisations;

  /// Projects
  final ProjectsState projects;

  /// Sections
  final SectionsState sections;

  /// Teams
  final TeamMember? teamMember;

  static AppState get initial => AppState(
        projects: ProjectsState.initial,
        sections: SectionsState.initial,
        organisations: OrganisationsState.initial,
        navigation: NavigationState.initial,
        auth: AuthState.initial,
        error: ErrorHandlingState.initial,
      );

  @override
  AppState copyWith({
    NavigationState? navigation,
    ErrorHandlingState? error,
    AuthState? auth,
    OrganisationsState? organisations,
    SectionsState? sections,
    ProjectsState? projects,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error,
        organisations: organisations ?? this.organisations,
        sections: sections ?? this.sections,
        projects: projects ?? this.projects,
      );

  @override
  JsonMap toJson() => {
        'navigation': navigation.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
        'organisations': organisations.toJson(),
        'sections': sections.toJson(),
        'projects': projects.toJson(),
      };
}
