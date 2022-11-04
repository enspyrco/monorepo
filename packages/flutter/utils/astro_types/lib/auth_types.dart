abstract class AuthState {
  abstract final UserState user;
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
