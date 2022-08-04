import 'package:enspyr_redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/types.dart';
import '../extensions/user_extension.dart';
import '../state/user_state.dart';

class FirebaseAuthService implements ReduxService {
  FirebaseAuthService(this.plugin);

  FirebaseAuth plugin;

  Future<FirebaseCredential> signInToFirebase(
      String idToken, String rawNonce) async {
    // Create an `OAuthCredential` from the credential returned by an auth provider.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: idToken,
      rawNonce: rawNonce,
    );

    // Sign in with Firebase. If the nonce we generated earlier does
    // not match the nonce in the identityToken, sign in will fail.
    return await plugin.signInWithCredential(oauthCredential);
  }

  Stream<UserState> tapIntoAuthState() {
    return plugin.authStateChanges().map((user) => user.toReduxState());
  }
}
