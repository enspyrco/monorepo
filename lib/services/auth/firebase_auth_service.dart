import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/actions/auth/store_sign_in_step_action.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/extensions/auth/firebase_auth_extensions.dart';
import 'package:flireator/extensions/auth/firebase_user_extensions.dart';
import 'package:flireator/models/auth/auth_data.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flireator/extensions/dart/stream_controller_extensions.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;

  /// [StreamController] for adding auth state actions
  final StreamController<ReduxAction> _actionsController;

  /// We keep a subscription to the firebase auth state stream so we can
  /// disconnect at a later time.
  StreamSubscription<User?>? _subscription;

  /// The [Stream] is used just once on app load, to
  /// connect the [Database] to the redux [Store]
  @override
  Stream<ReduxAction> get storeStream => _actionsController.stream;

  FirebaseAuthService({
    FirebaseAuth? auth,
    StreamController<ReduxAction>? actionsController,
  })  : _firebaseAuth = auth ?? FirebaseAuth.instance,
        _actionsController =
            actionsController ?? StreamController<ReduxAction>();

  /// Connect the firebase auth state to the store and keep the subscription.
  @override
  void connectAuthStateToStore() {
    try {
      _subscription?.cancel();
      _subscription = _firebaseAuth.connectAuthStateToStore(_actionsController);
    } catch (error, trace) {
      _actionsController.addProblem(error, trace);
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    final user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  @override
  void disconnectAuthState() {
    _subscription?.cancel();
  }

  // The sign in updates the app state as the services have been plumbed so
  // the stream of auth state is connected to the store.
  @override
  Future<AuthData?> signInWithApple() async {
    // update the app state to show the sign in step
    _actionsController
        .add(StoreSignInStepAction(step: SignInStep.contactingApple));

    // perform the sign in
    final appleIdCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
        clientId: 'co.enspyr.flireator.service',
        redirectUri: Uri.parse(
          'https://amused-wave-hydrogen.glitch.me/callbacks/sign_in_with_apple',
        ),
      ),
    );

    // create an OAuthCredential from the apple id credential
    final credential = OAuthProvider('apple.com').credential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );

    // update app state to show we are now signing in with firebase
    _actionsController
        .add(StoreSignInStepAction(step: SignInStep.signingInWithFirebase));

    // use the credential to sign in to firebase
    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // update the firebase user with the name from apple (as firebase does not)
    if (appleIdCredential.givenName != null ||
        appleIdCredential.familyName != null) {
      await authResult.user?.updateProfile(
          displayName:
              '${appleIdCredential.givenName} ${appleIdCredential.familyName}');
    }

    return authResult.user?.toData();
  }

  /// The stream of auth state is connected to the store so the app state will
  /// be automatically updated
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
