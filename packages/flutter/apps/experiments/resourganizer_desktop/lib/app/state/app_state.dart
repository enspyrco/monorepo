import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/state_types.dart';

class AppState
    with
        AstroState,
        DefaultErrorHandlingState,
        DefaultAuthState,
        DefaultNavigationState {
  AppState({required this.error, required this.user, required this.navigation});

  static AppState get initial => AppState(
      error: ErrorHandlingState.initial,
      user: UserState.initial,
      navigation: NavigationState.initial);

  @override
  final UserState user;

  @override
  final ErrorHandlingState error;

  @override
  final NavigationState navigation;

  @override
  AppState copyWith({
    ErrorHandlingState? error,
    UserState? user,
    NavigationState? navigation,
  }) {
    return AppState(
      error: error ?? this.error,
      user: user ?? this.user,
      navigation: navigation ?? this.navigation,
    );
  }

  @override
  toJson() => {
        'user': user.toJson(),
        'error': error.toJson(),
        'navigation': navigation.toJson(),
      };
}
