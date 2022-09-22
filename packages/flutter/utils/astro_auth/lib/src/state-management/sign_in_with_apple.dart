import 'package:astro/astro.dart';
import 'package:json_types/json_types.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../utils/nonce.dart';
import 'sign_in_with_firebase.dart';

class SignInWithApple<T extends RootState> extends AwayMission<T> {
  /// From: `somewhere I can't remember now...`
  /// To prevent replay attacks with the credential returned from Apple, we
  /// include a nonce in the credential request. When signing in with
  /// Firebase, the nonce in the id token returned by Apple, is expected to
  /// match the sha256 hash of `rawNonce`.
  ///
  /// From: `firebase_auth_platform_interface-6.5.2/lib/src/providers/oauth.dart`:
  /// The raw nonce associated with the ID token. It is required when an ID
  /// token with a nonce field is provided. The SHA-256 hash of the raw nonce
  /// must match the nonce field in the ID token.

  // final nonce = sha256ofString(rawNonce);
  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    final plugin.AuthorizationCredentialAppleID credential =
        await plugin.SignInWithApple.getAppleIDCredential(
      scopes: [
        plugin.AppleIDAuthorizationScopes.email,
        plugin.AppleIDAuthorizationScopes.fullName,
      ],
    );

    var token = credential.identityToken ??
        (throw 'The credential.identityToken variable was null');

    missionControl.launch(
        SignInWithFirebase<T>(idToken: token, rawNonce: generateNonce())
          ..parent = this);
  }

  @override
  JsonMap toJson({int? parentId}) => {
        'name_': 'Sign In With Apple',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId,
        'state_': <String, dynamic>{}
      };
}
