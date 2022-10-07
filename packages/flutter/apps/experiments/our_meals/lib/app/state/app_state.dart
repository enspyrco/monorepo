import 'dart:collection';

import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

class AppState with AstroState, ErrorHandlingState, AuthState {
  AppState({required this.user, required this.errorMessages});

  static AppState get initial => AppState(
      user: UserState.initial, errorMessages: UnmodifiableListView([]));

  @override
  final UserState user;

  @override
  final List<ErrorReport> errorMessages;

  @override
  AppState copyWith({List<ErrorReport>? errorMessages, UserState? user}) {
    return AppState(
        user: user ?? this.user,
        errorMessages: errorMessages ?? this.errorMessages);
  }

  @override
  toJson() => {
        'user': user.toJson(),
        'errorMessages': errorMessages.map((e) => e.toJson()).toList()
      };
}
