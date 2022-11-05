import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/state_types.dart';

class AppState
    implements
        AstroState,
        AppStateErrorHandling,
        AppStateAuth,
        DefaultNavigationState {
  AppState({required this.error, required this.auth, required this.navigation});

  static AppState get initial => AppState(
      error: DefaultErrorHandlingState.initial,
      auth: DefaultAuthState.initial,
      navigation: NavigationState.initial);

  @override
  final DefaultAuthState auth;

  @override
  final DefaultErrorHandlingState error;

  @override
  final NavigationState navigation;

  @override
  AppState copyWith({
    DefaultErrorHandlingState? error,
    DefaultAuthState? auth,
    NavigationState? navigation,
  }) {
    return AppState(
      error: error ?? this.error,
      auth: auth ?? this.auth,
      navigation: navigation ?? this.navigation,
    );
  }

  @override
  toJson() => {
        'auth': auth.toJson(),
        'error': error.toJson(),
        'navigation': navigation.toJson(),
      };
}
