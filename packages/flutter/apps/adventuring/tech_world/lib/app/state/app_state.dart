import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

import '../../challenges/models/challenge_model.dart';
import '../../game/game_state.dart';

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
    // required Settings settings,
    // ProfileData? profile,
    required this.game,
    this.challenge,
  });

  @override
  final AuthState auth;
  @override
  final DefaultErrorHandlingState error;
  @override
  final DefaultNavigationState navigation;

  // final Settings settings;
  // final ProfileData? profile;

  final GameState game;
  final ChallengeModel? challenge;

  static AppState get initial => AppState(
        auth: AstroAuth.initialState(),
        error: DefaultErrorHandlingState.initial,
        navigation: DefaultNavigationState.initial,
        // settings: Settings.initial,
        game: GameState.initial,
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    AuthState? auth,
    GameState? game,
    ChallengeModel? challenge,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error,
        game: game ?? this.game,
        challenge: challenge ?? this.challenge,
      );

  @override
  toJson() => {
        'navigation': navigation.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
        'game': game.toJson(),
        'challenge': challenge?.toJson(),
      };
}
