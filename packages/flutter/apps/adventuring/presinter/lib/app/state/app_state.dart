import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class AppState
    implements
        AstroState,
        AppStateNavigation,
        AppStateErrorHandling,
        AppStateAuth {
  AppState({
    required this.auth,
    required this.error,
    required this.navigation,
  });

  @override
  final AuthState auth;
  @override
  final DefaultErrorHandlingState error;
  @override
  final DefaultNavigationState navigation;

  static AppState get initial => AppState(
        auth: AstroAuth.initialState(),
        error: DefaultErrorHandlingState.initial,
        navigation: DefaultNavigationState.initial,
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    AuthState? auth,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error,
      );

  @override
  toJson() => {
        'navigation': navigation.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
      };
}
