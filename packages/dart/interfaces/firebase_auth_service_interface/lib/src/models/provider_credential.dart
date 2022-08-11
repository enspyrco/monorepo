import 'package:firebase_auth_service_interface/src/enums/provider_enum.dart';

/// `sign_in_with_apple` gives us an `AppleIdCredential` (called `credential` below)
/// which is used to create an `OAuthProvider`, which is then used with
/// `FirebaseAuth` to sign in:
///
/// ```dart
/// oAuthCredential = OAuthProvider('apple.com').credential(
///   accessToken: credential.authorizationCode,
///   idToken: credential.identityToken,
/// );
/// FirebaseAuth.instance.signInWithCredential(oAuthCredential);
/// ```
///
///
/// `google_sign_in` gives us a `GoogleSignInAuthentication` (called `credential` below)
/// which is used to create an `OAuthProvider`, which is then used with
/// `FirebaseAuth` to sign in:
///
/// ```dart
/// oAuthCredential = GoogleAuthProvider.credential(
///   accessToken: credential.accessToken,
///   idToken: credential.idToken,
/// );
///
/// FirebaseAuth.instance.signInWithCredential(oAuthCredential);
/// ```

class ProviderCredential {
  ProviderCredential(this.provider, this.accessToken, this.idToken);
  final ProviderEnum provider;
  final String accessToken;
  final String idToken;
}
