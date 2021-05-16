import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignInWrapper {
  Future<AuthorizationCredentialAppleID> getCredential() =>
      SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
}
