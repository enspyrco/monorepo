import 'package:firebase_auth/firebase_auth.dart';

import '../extensions/user_extension.dart';
import '../state/default_user_state.dart';
import '../utils/types.dart';

class FirebaseAuthService {
  FirebaseAuthService({FirebaseAuth? plugin})
      : _plugin = plugin ?? FirebaseAuth.instance;

  final FirebaseAuth _plugin;

  Future<FirebaseCredential> signInToFirebase(
      String idToken, String rawNonce) async {
    // Create an `OAuthCredential` from the credential returned by an auth provider.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: idToken,
      rawNonce: rawNonce,
    );

    // Sign in with Firebase. If the nonce we generated earlier does
    // not match the nonce in the identityToken, sign in will fail.
    return await _plugin.signInWithCredential(oauthCredential);
  }

  Stream<DefaultUserState> tapIntoAuthState() {
    return _plugin.authStateChanges().map((user) => user.toState());
  }

  Future<void> signOut() async => _plugin.signOut();
}
