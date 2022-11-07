import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../adventures/models/adventures_state.dart';
import '../../challenges/models/challenges_state.dart';
import '../../steps/models/steps_state.dart';
import '../../tasks/models/tasks_state.dart';

@immutable
class AppState
    implements
        AstroState,
        AppStateErrorHandling,
        AppStateNavigation,
        AppStateAuth {
  const AppState({
    required this.navigation,
    required this.auth,
    required this.error,

    ///
    // required Settings settings,
    // ProfileData? profile,

    /// Additional AppState members
    required this.adventures,
    required this.challenges,
    required this.tasks,
    required this.steps,
  });

  @override
  final DefaultNavigationState navigation;

  @override
  final DefaultAuthState auth;

  @override
  final DefaultErrorHandlingState error;

  final AdventuresState adventures;
  final ChallengesState challenges;
  final TasksState tasks;
  final StepsState steps;

  static AppState get initial => AppState(
        navigation: DefaultNavigationState.initial,
        auth: DefaultAuthState.initial,
        error: DefaultErrorHandlingState.initial,

        // settings: Settings.init(),

        // Additional init code
        adventures: AdventuresState.initial,
        challenges: ChallengesState.initial,
        tasks: TasksState.initial,
        steps: StepsState.initial,
      );

  @override
  AppState copyWith({
    DefaultNavigationState? navigation,
    DefaultErrorHandlingState? error,
    DefaultAuthState? auth,
    AdventuresState? adventures,
    ChallengesState? challenges,
    TasksState? tasks,
    StepsState? steps,
  }) =>
      AppState(
        navigation: navigation ?? this.navigation,
        auth: auth ?? this.auth,
        error: error ?? this.error,
        adventures: adventures ?? this.adventures,
        challenges: challenges ?? this.challenges,
        tasks: tasks ?? this.tasks,
        steps: steps ?? this.steps,
      );

  @override
  toJson() => {
        'navigation': navigation.toJson(),
        'auth': auth.toJson(),
        'error': error.toJson(),
        'adventures': adventures.toJson(),
        'challenges': challenges.toJson(),
        'tasks': tasks.toJson(),
        'steps': steps.toJson(),
      };
}
