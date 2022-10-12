import 'dart:collection';

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
  AppState(
      {required this.navigation, required this.user, required this.reports});

  static AppState get initial => AppState(
      navigation: NavigationState.initial,
      user: UserState.initial,
      reports: UnmodifiableListView([]));

  @override
  final NavigationState navigation;

  @override
  final UserState user;

  @override
  final List<ErrorReport> reports;

  @override
  AppState copyWith(
      {NavigationState? navigation,
      List<ErrorReport>? reports,
      UserState? user}) {
    return AppState(
        navigation: navigation ?? this.navigation,
        user: user ?? this.user,
        reports: reports ?? this.reports);
  }

  @override
  toJson() => {
        'user': user.toJson(),
        'reports': reports.map((e) => e.toJson()).toList(),
        'navigation': navigation.toJson(),
      };
}
