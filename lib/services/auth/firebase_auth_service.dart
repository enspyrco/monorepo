import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/extensions/auth/firebase_auth_extensions.dart';
import 'package:flireator/extensions/auth/firebase_user_extensions.dart';
import 'package:flireator/models/auth/user_data.dart';
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
  StreamSubscription<FirebaseUser> _firebaseAuthStateSubscription;

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
  Future<String> getCurrentUserId() async {
    final user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  @override
  void disconnectAuthState() {
    _firebaseAuthStateSubscription?.cancel();
  }

  // The sign in updates the app state as the services have been plumbed so
  // the stream of auth state is connected to the store.
  @override
  Future<UserData> signInWithApple() async {
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

    // get an OAuthCredential
    final credential = OAuthProvider(providerId: 'apple.com').getCredential(
      idToken: appleIdCredential.identityToken,
      accessToken: appleIdCredential.authorizationCode,
    );

    // use the credential to sign in to firebase
    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // update the firebase user with the name from apple (as firebase does not)
    await authResult.user.updateProfile(UserUpdateInfo()
      ..displayName =
          '${appleIdCredential.givenName} ${appleIdCredential.familyName}');

    return authResult.user.toData();
  }

  /// The stream of auth state is connected to the store so the app state will
  /// be automatically updated
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
