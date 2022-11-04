import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/state_types.dart';

class AppState
    implements
        AstroState,
        DefaultErrorHandlingState,
        AppStateAuth,
        DefaultNavigationState {
  const AppState(
      {required this.error, required this.auth, required this.navigation});

  static AppState get initial => AppState(
      error: ErrorHandlingState.initial,
      auth: AuthState.initial,
      navigation: NavigationState.initial);

  @override
  final AuthState auth;

  @override
  final ErrorHandlingState error;

  @override
  final NavigationState navigation;

  @override
  AppState copyWith({
    ErrorHandlingState? error,
    AuthState? auth,
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
