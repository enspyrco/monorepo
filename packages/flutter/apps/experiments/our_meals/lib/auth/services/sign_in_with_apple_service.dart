import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../../utils/types.dart';

class SignInWithAppleService {
  // Request credential for the currently signed in Apple account.
  Future<AppleCredential> signInWithApple(String nonce) async {
    final appleCredential = await plugin.SignInWithApple.getAppleIDCredential(
      scopes: [
        plugin.AppleIDAuthorizationScopes.email,
        plugin.AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    return appleCredential;
  }
}
