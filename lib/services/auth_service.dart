import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_browser.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/extensions/auth_plugin_extensions.dart';
import 'package:the_process/extensions/googleapis_auth_plugin.dart';
import 'package:the_process/extensions/stream_extensions.dart';
import 'package:the_process/models/auth/access_credentials.dart' as model;
import 'package:the_process/models/auth/apple_id_credential.dart';
import 'package:the_process/models/auth/auth_user_data.dart';
import 'package:the_process/models/auth/google_sign_in_credential.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  /// [StreamController] for adding auth state actions
  final StreamController<ReduxAction> _controller;

  /// The [Stream] is used just once on app load, to
  /// connect the [Database] to the redux [Store]

  Stream<ReduxAction> get storeStream => _controller.stream;

  /// We keep a subscription to the firebase auth state stream so we can
  /// disconnect at a later time.
  StreamSubscription<User> _firebaseAuthStateSubscription;

  AuthService(
      FirebaseAuth firebaseAuth, StreamController<ReduxAction> _controller)
      : _firebaseAuth = firebaseAuth,
        _controller = _controller;

  void connectAuthStateToStore() {
    try {
      // connect the firebase auth state to the store and keep the subscription
      _firebaseAuthStateSubscription?.cancel();
      _firebaseAuthStateSubscription =
          _firebaseAuth.connectAuthState(_controller);
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }

  Future<String> getCurrentUserId() async {
    final user = _firebaseAuth.currentUser;
    return user.uid;
  }

  void disconnectAuthState() {
    _firebaseAuthStateSubscription?.cancel();
  }

  Future<GoogleSignInCredential> getGoogleCredential() async {
    final _googleSignIn = GoogleSignIn(
        scopes: ['email', 'https://www.googleapis.com/auth/drive.file']);

    final googleSignInAccount = await _googleSignIn.signIn();
    final googleSignInAuthentication = await googleSignInAccount.authentication;

    return googleSignInAuthentication.toModel();
  }

  Future<AuthUserData> signInWithGoogle(
      {@required GoogleSignInCredential credential}) async {
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: credential.accessToken,
      idToken: credential.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(authCredential);
    final user = userCredential.user;
    return user.toModel();
  }

  Future<AppleIdCredential> getAppleCredential() async {
    final appleIdCredential =
        await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);

    return appleIdCredential.toModel();
  }

  Future<AuthUserData> signInWithApple(
      {@required AppleIdCredential credential}) async {
    // convert to OAuthCredential
    final oAuthCredential = OAuthProvider('apple.com').credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );

    // use the credential to sign in to firebase
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
    final user = userCredential.user;
    return user.toModel();
  }

  /// The stream of auth state is connected to the store so the app state will
  /// be automatically updated
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<model.AccessCredentials> getAuthorized() async {
    final id = new ClientId(
        '256145062869-mhc784a6tkdd9b08455vqog5shjk2d5q.apps.googleusercontent.com',
        null);
    var scopes = [
      'https://www.googleapis.com/auth/documents',
      'https://www.googleapis.com/auth/documents.readonly',
      'https://www.googleapis.com/auth/drive',
      'https://www.googleapis.com/auth/drive.file',
      'https://www.googleapis.com/auth/drive.readonly',
    ];

    // Initialize the browser oauth2 flow functionality.
    BrowserOAuth2Flow flow = await createImplicitBrowserFlow(id, scopes);

    // HybridFlowResult result = await flow.runHybridFlow(force: true);
    // print('---------------------------------------');
    // print(result.authorizationCode);
    // print('---------------------------------------');
    // print(result.credentials.accessToken.data);
    // print('---------------------------------------');

    AccessCredentials credentials =
        await flow.obtainAccessCredentialsViaUserConsent(force: true);
    return credentials.toModel();

    // responseTypes: [ResponseType.code],

    // void prompt(String url) {
    //   print('Please go to the following URL and grant access:');
    //   print('  => $url');
    //   print('');
    // }

    // var client = new http.Client();
    // final accessCredentials =
    //     await obtainAccessCredentialsViaUserConsent(id, scopes, client, prompt);
    // client.close();
  }
}
