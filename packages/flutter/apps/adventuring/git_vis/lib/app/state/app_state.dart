import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';
import 'package:git_vis/git/models/object_database_state.dart';

@immutable
class AppState
    implements AstroState, AppStateNavigation, AppStateErrorHandling {
  const AppState({
    required this.navigation,
    required this.error,
    required this.odb,
  });

  @override
  final DefaultNavigationState navigation;

  @override
  final DefaultErrorHandlingState error;

  final ObjectDatabaseState odb;

  static AppState get initial => AppState(
        navigation: DefaultNavigationState.initial,
        error: DefaultErrorHandlingState.initial,
        odb: ObjectDatabaseState.initial,
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    ObjectDatabaseState? odb,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        error: error ?? this.error,
        odb: odb ?? this.odb,
      );

  @override
  JsonMap toJson() => {
        'navigation': navigation.toJson(),
        'error': error.toJson(),
        'odb': odb.toJson(),
      };
}
