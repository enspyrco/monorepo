import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_error_handling/astro_error_handling.dart';

class AppState extends RootState with AstroAuth {
  AppState({required this.errorMessages, required this.user});

  static AppState get initial => AppState(
        errorMessages: const [],
        user: UserState(signedIn: SignedInState.checking),
      );

  @override
  final UserState user;

  @override
  final List<ErrorMessage> errorMessages;

  @override
  AppState copyWith({List<ErrorMessage>? errorMessages, UserState? user}) {
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
