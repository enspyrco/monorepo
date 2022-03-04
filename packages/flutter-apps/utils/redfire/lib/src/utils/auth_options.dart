class AuthOptions {
  const AuthOptions({this.clientId});

  // There are different values for web, android & ios - the relevant option
  // is set at runtime.
  //
  // The clientId is not needed for GoogleSignIn on Android.
  final String? clientId;
}
