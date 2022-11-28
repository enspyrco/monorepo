import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

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
  });

  @override
  final DefaultNavigationState navigation;

  @override
  final DefaultAuthState auth;

  @override
  final DefaultErrorHandlingState error;

  static AppState get initial => AppState(
        navigation: DefaultNavigationState.initial,
        auth: DefaultAuthState.initial,
        error: DefaultErrorHandlingState.initial,
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    DefaultAuthState? auth,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error,
      );

  @override
  JsonMap toJson() => {
        'navigation': navigation.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
      };
}
