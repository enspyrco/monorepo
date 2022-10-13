import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/state_types.dart';

class AppState
    with
        AstroState,
        DefaultNavigationState,
        DefaultErrorHandlingState,
        DefaultAuthState {
  AppState({required this.navigation, required this.user, required this.error});

  static AppState get initial => AppState(
        navigation: NavigationState.initial,
        user: UserState.initial,
        error: ErrorHandlingState.initial,
      );

  @override
  final NavigationState navigation;

  @override
  final UserState user;

  @override
  final ErrorHandlingState error;

  @override
  AppState copyWith(
      {NavigationState? navigation,
      ErrorHandlingState? error,
      UserState? user}) {
    return AppState(
        navigation: navigation ?? this.navigation,
        user: user ?? this.user,
        error: error ?? this.error);
  }

  @override
  toJson() => {
        'user': user.toJson(),
        'error': error.toJson(),
        'navigation': navigation.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      other is AppState &&
      other.navigation == navigation &&
      other.user == user &&
      other.error == error;

  @override
  int get hashCode => Object.hash(navigation, user, error);
}
