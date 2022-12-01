import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

@immutable
class AppState
    implements AstroState, AppStateNavigation, AppStateErrorHandling {
  const AppState({
    required this.navigation,
    required this.error,
  });

  @override
  final DefaultNavigationState navigation;

  @override
  final DefaultErrorHandlingState error;

  static AppState get initial => AppState(
        navigation: DefaultNavigationState.initial,
        error: DefaultErrorHandlingState.initial,
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        error: error ?? this.error,
      );

  @override
  JsonMap toJson() => {
        'navigation': navigation.toJson(),
        'error': error.toJson(),
      };
}
