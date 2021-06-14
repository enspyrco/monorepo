import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redfire/actions/store_auth_step_action.dart';
import 'package:redfire/actions/store_auth_user_data_action.dart';
import 'package:redfire/auth/extensions/auth_extensions.dart';
import 'package:redfire/auth/models/apple_id_credential.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/platform/plugins/wrappers/apple_signin_wrapper.dart';
import 'package:redfire/problems/extensions/error_extensions.dart';
import 'package:redfire/types/redux_action.dart';
import 'package:redfire/types/redux_service.dart';

class AuthService extends ReduxService {
  AuthService(this._fireAuth, this._googleSignIn, this._appleSignInWrapper);

  final FirebaseAuth _fireAuth;
  final GoogleSignIn _googleSignIn;
  final AppleSignInWrapper _appleSignInWrapper;

  // Map FirebaseUser objects emitted by FirebaseAuth to a StoreUser action,
  // which can be dispatched by the store.
  // If the FirebaseUser or the uid field is null, create an empty StoreUser
  // object that will set the user field of the AppState to null.
  Stream<ReduxAction> get streamOfStateChanges {
    return _fireAuth
        .authStateChanges()
        .map((user) => StoreAuthUserDataAction(user?.toModel()));
  }

  Stream<ReduxAction> get googleSignInStream async* {
    // signal to change UI
    yield StoreAuthStepAction.contactingGoogle();

    try {
      final googleUser = await _googleSignIn.signIn();

      // if the user canceled signin, an error is thrown but it gets swallowed
      // by the signIn() method so we need to reset the UI and close the stream
      if (googleUser == null) {
        yield StoreAuthStepAction.waitingForInput();
        return;
      }

      // signal to change UI
      yield StoreAuthStepAction.signingInWithFirebase();

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      /// the auth info will be picked up by the listener on [onAuthStateChanged]
      /// and emitted by [streamOfStateChanges]
      await _fireAuth.signInWithCredential(credential);

      // we are signed in so reset the UI
      yield StoreAuthStepAction.waitingForInput();
    } catch (error, trace) {
      // reset the UI and display an alert

      yield StoreAuthStepAction.waitingForInput();
      // errors with code kSignInCanceledError are swallowed by the
      // GoogleSignIn.signIn() method so we can assume anything caught here
      // is a problem and send to the store for display
      yield error.toAddProblemAction(trace);
    }
  }

  Future<AppleIdCredential> getAppleCredential() async {
    final appleIdCredential = await _appleSignInWrapper.getCredential();
    return appleIdCredential.toModel();
  }

  Future<AuthUserData> signInWithApple(
      {required AppleIdCredential credential}) async {
    // convert to OAuthCredential
    final oAuthCredential = OAuthProvider('apple.com').credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );

    // use the credential to sign in to firebase
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
    // not sure why user would be null (docs don't say) so we throw if it is
    final user = userCredential.user!;
    return user.toModel();
  }
}
