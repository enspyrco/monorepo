import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../shared/models/package.dart';

class AppState
    implements
        AstroState,
        AppStateNavigation,
        AppStateErrorHandling,
        AppStateAuth {
  const AppState({
    required this.error,
    required this.auth,
    required this.navigation,
    required this.packages,
  });

  static AppState get initial => AppState(
        error: DefaultErrorHandlingState.initial,
        auth: DefaultAuthState.initial,
        navigation: DefaultNavigationState.initial,
        packages: {},
      );

  @override
  final DefaultAuthState auth;

  @override
  final DefaultErrorHandlingState error;

  @override
  final DefaultNavigationState navigation;

  final Set<Package> packages;

  @override
  AppState copyWith({
    DefaultErrorHandlingState? error,
    DefaultAuthState? auth,
    DefaultNavigationState? navigation,
    Set<Package>? packages,
  }) {
    return AppState(
      error: error ?? this.error,
      auth: auth ?? this.auth,
      navigation: navigation ?? this.navigation,
      packages: packages ?? this.packages,
    );
  }

  @override
  toJson() => {
        'auth': auth.toJson(),
        'error': error.toJson(),
        'navigation': navigation.toJson(),
        'packages': packages,
      };
}
