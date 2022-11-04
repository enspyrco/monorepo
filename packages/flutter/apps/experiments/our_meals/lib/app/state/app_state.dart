import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/state_types.dart';

class AppState
    implements
        AstroState,
        DefaultNavigationState,
        DefaultErrorHandlingState,
        AppStateAuth {
  AppState({required this.navigation, required this.auth, required this.error});

  static AppState get initial => AppState(
        navigation: NavigationState.initial,
        auth: DefaultAuthState.initial,
        error: ErrorHandlingState.initial,
      );

  @override
  final NavigationState navigation;

  @override
  final DefaultAuthState auth;

  @override
  final ErrorHandlingState error;

  @override
  AppState copyWith(
      {NavigationState? navigation,
      ErrorHandlingState? error,
      DefaultAuthState? auth}) {
    return AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error);
  }

  @override
  toJson() => {
        'auth': auth.toJson(),
        'error': error.toJson(),
        'navigation': navigation.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      other is AppState &&
      other.navigation == navigation &&
      other.auth == auth &&
      other.error == error;

  @override
  int get hashCode => Object.hash(navigation, auth, error);
}
