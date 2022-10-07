import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_state_interface/astro_state_interface.dart';

class AppState with AstroState, ErrorHandlingState, AuthState {
  AppState({required this.errorMessages, required this.user});

  static AppState get initial => AppState(
        errorMessages: const [],
        user: UserState(signedIn: SignedInState.checking),
      );

  @override
  final UserState user;

  @override
  final List<ErrorReport> errorMessages;

  @override
  AppState copyWith({List<ErrorReport>? errorMessages, UserState? user}) {
    return AppState(
      errorMessages: errorMessages ?? this.errorMessages,
      user: user ?? this.user,
    );
  }

  @override
  toJson() => {
        'user': user.toJson(),
        'errorMessages': errorMessages.map((e) => e.toJson()).toList(),
      };
}
