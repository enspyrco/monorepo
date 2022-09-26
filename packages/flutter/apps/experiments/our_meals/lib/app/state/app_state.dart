import 'dart:collection';

import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';

class AppState extends RootState with AstroAuth {
  AppState({required this.user, required this.errorMessages});

  static AppState get initial => AppState(
      user: UserState.initial, errorMessages: UnmodifiableListView([]));

  @override
  final UserState user;

  @override
  final List<ErrorMessage> errorMessages;

  @override
  AppState copyWith({List<ErrorMessage>? errorMessages, UserState? user}) {
    return AppState(
        user: user ?? this.user,
        errorMessages: errorMessages ?? this.errorMessages);
  }

  @override
  toJson() => {
        'user': user.toJson(),
        'errorMessages': errorMessages.map((e) => e.toJson())
      };
}
