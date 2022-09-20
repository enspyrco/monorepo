import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';

class AppState extends RootState with AuthState {
  AppState({List<ErrorMessage>? errorMessages, required this.user}) {
    if (errorMessages != null) super.errorMessages = errorMessages;
  }

  static AppState get initial => AppState(
        errorMessages: [],
        user: UserState(signedIn: SignedInState.checking),
      );

  @override
  AppState copyWith({List<ErrorMessage>? errorMessages, UserState? user}) {
    return AppState(
      errorMessages: errorMessages ?? errorMessages,
      user: user ?? this.user,
    );
  }

  @override
  final UserState user;

  @override
  toJson() => {'user': user.toJson()};
}
