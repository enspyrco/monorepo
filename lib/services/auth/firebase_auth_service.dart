import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/actions/auth/store_sign_in_step.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/enums/auth/sign_in_step.dart';
import 'package:flireator/extensions/auth/firebase_auth_extensions.dart';
import 'package:flireator/extensions/auth/firebase_user_extensions.dart';
import 'package:flireator/models/auth/auth_data.dart';
import 'package:flireator/services/auth/auth_service.dart';
import 'package:flireator/utils/problems_utils.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;

  /// [StreamController] for adding auth state actions
  final StreamController<ReduxAction> _storeStreamController;

  /// The [Stream] is used just once on app load, to
  /// connect the [Database] to the redux [Store]
  @override
  Stream<ReduxAction> get storeStream => _storeStreamController.stream;

  /// We keep a subscription to the firebase auth state stream so we can
  /// disconnect at a later time.
  StreamSubscription<User?>? _firebaseAuthStateSubscription;

  FirebaseAuthService(FirebaseAuth firebaseAuth,
      StreamController<ReduxAction> _storeStreamController)
      : _firebaseAuth = firebaseAuth,
        _storeStreamController = _storeStreamController;

  @override
  void connectAuthStateToStore() {
    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(_storeStreamController.add,
        'FirebaseAuthService -> connectAuthStateToStore');

    try {
      // connect the firebase auth state to the store and keep the subscription
      _firebaseAuthStateSubscription?.cancel();
      _firebaseAuthStateSubscription =
          _firebaseAuth.connectAuthStateToStore(_storeStreamController);
    } catch (error, trace) {
      handleProblem(error, trace);
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    final user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  @override
  void disconnectAuthState() {
    _firebaseAuthStateSubscription?.cancel();
  }

  // The sign in updates the app state as the services have been plumbed so
  // the stream of auth state is connected to the store.
  @override
  Future<AuthData?> signInWithApple() async {
    // update the app state to show the sign in step
    _storeStreamController
        .add(StoreSignInStep(step: SignInStep.signingInWithApple));

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
    _storeStreamController
        .add(StoreSignInStep(step: SignInStep.signingInWithFirebase));

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
