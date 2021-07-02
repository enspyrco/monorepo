import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInWrapper {
  Future<AuthorizationCredentialAppleID> getCredential(
          {List<AppleIDAuthorizationScopes>? scopes}) =>
      SignInWithApple.getAppleIDCredential(
          scopes: (scopes == null)
              ? [
                  AppleIDAuthorizationScopes.email,
                  AppleIDAuthorizationScopes.fullName
                ]
              : scopes);
}
