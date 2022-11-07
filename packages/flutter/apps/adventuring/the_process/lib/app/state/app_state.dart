import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/navigation_types.dart';
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
        AppStateNavigation,
        AppStateErrorHandling,
        AppStateAuth {
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
  final DefaultNavigationState navigation;

  @override
  final DefaultAuthState auth;

  @override
  final DefaultErrorHandlingState error;

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
        navigation: DefaultNavigationState.initial,
        auth: DefaultAuthState.initial,
        error: DefaultErrorHandlingState.initial,
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    DefaultAuthState? auth,
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
