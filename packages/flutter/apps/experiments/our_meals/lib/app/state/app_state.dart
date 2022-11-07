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
  AppState({required this.navigation, required this.auth, required this.error});

  static AppState get initial => AppState(
        navigation: DefaultNavigationState.initial,
        auth: DefaultAuthState.initial,
        error: DefaultErrorHandlingState.initial,
      );

  @override
  final DefaultNavigationState navigation;

  @override
  final DefaultAuthState auth;

  @override
  final DefaultErrorHandlingState error;

  @override
  AppState copyWith(
      {DefaultNavigationState? navigation,
      DefaultErrorHandlingState? error,
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
