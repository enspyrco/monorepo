import 'json_types.dart';
import 'state_types.dart';

abstract class AppStateAuth {
  abstract final AuthState auth;
}

abstract class AuthState implements AstroState {
  UserState get user;

  @override
  AuthState copyWith({UserState? user});

  @override
  JsonMap toJson();
}

abstract class UserState {
  abstract final SignedInState signedIn;
  abstract final String? uid;
  abstract final String? displayName;
  abstract final String? photoURL;
}

enum SignedInState {
  checking(true),
  notSignedIn(false),
  signingIn(true),
  signedIn(true);

  const SignedInState(this.disableButton);

  final bool disableButton;
}
