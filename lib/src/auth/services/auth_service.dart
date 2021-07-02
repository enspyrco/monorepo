import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redfire/src/auth/actions/store_auth_user_data_action.dart';
import 'package:redfire/src/auth/extensions/auth_extensions.dart';
import 'package:redfire/src/auth/models/apple_id_credential.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/auth/models/google_sign_in_credential.dart';
import 'package:redfire/src/platform/plugins/wrappers/apple_signin_wrapper.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/redux_service.dart';

class AuthService extends ReduxService {
  AuthService(this._fireAuth, this._googleSignIn, this._appleSignInWrapper);

  // final FirebaseAuth _firebaseAuth;
  // PlatformsEnum? _platform;

  // /// [StreamController] for adding auth state actions
  // final StreamController<ReduxAction> _eventsController;

  // /// The [Stream] is used just once on app load, to
  // /// connect the [Database] to the redux [Store]

  // Stream<ReduxAction> get storeStream => _eventsController.stream;

  // /// We keep a subscription to the firebase auth state stream so we can
  // /// disconnect at a later time.
  // StreamSubscription<User?>? _firebaseAuthStateSubscription;

  // AuthService(
  //     {FirebaseAuth? auth, StreamController<ReduxAction>? eventsController})
  //     : _firebaseAuth = auth ?? FirebaseAuth.instance,
  //       _eventsController = eventsController ?? StreamController<ReduxAction>();

  // set platform(PlatformsEnum platform) => _platform = platform;

  // void connectAuthStateToStore() {
  //   try {
  //     // connect the firebase auth state to the store and keep the subscription
  //     _firebaseAuthStateSubscription?.cancel();
  //     _firebaseAuthStateSubscription =
  //         _firebaseAuth.connectAuthState(_eventsController);
  //   } catch (error, trace) {
  //     _eventsController.addProblem(error, trace);
  //   }
  // }

  // String? getCurrentUserId() => _firebaseAuth.currentUser?.uid;

  // Future<String>? getCurrentUserIdToken() =>
  //     _firebaseAuth.currentUser?.getIdToken();

  // void disconnectAuthState() {
  //   _firebaseAuthStateSubscription?.cancel();
  // }

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

  /// `null` in case where sign in process was aborted
  Future<GoogleSignInCredential?> getGoogleCredential() async {
    final _googleSignIn = GoogleSignIn(scopes: ['email']);

    final googleSignInAccount = await _googleSignIn.signIn();
    final googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    return googleSignInAuthentication?.toModel();
  }

  Future<AuthUserData> signInWithGoogle(
      {required GoogleSignInCredential credential}) async {
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: credential.accessToken,
      idToken: credential.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
    // not sure why user would be null (docs don't say) so we throw if it is
    final user = userCredential.user!;
    return user.toModel();
  }

  Future<AppleIdCredential> getAppleCredential() async {
    // By default, scopes = email, fullName
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

  // /// The stream of auth state is connected to the store so the app state will
  // /// be automatically updated
  // Future<void> signOut() async {
  //   // The available auth plugins depend on platform so if it's not set just return
  //   if (_platform == null) return;
  //   if (_platform != PlatformsEnum.iOS && _platform != PlatformsEnum.macOS) {
  //     final googleSignIn = GoogleSignIn(scopes: ['email']);
  //     await googleSignIn.signOut();
  //   }
  //   await _firebaseAuth.signOut();
  // }
}
