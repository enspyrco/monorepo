enum SignedInState {
  checking(true),
  notSignedIn(false),
  signingIn(true),
  signedIn(true);

  final bool disable;
  const SignedInState(this.disable);
}
