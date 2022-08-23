import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../../utils/types.dart';

class SignInWithAppleService {
  // late final String _nonce;
  // late final String _rawNonce;

  // // To prevent replay attacks with the credential returned from Apple, we
  // // include a nonce in the credential request. When signing in with
  // // Firebase, the nonce in the id token returned by Apple, is expected to
  // // match the sha256 hash of `rawNonce`.
  // final _rawNonce = generateNonce();
  // final _nonce = sha256ofString(_rawNonce);

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
