import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redfire/src/auth/actions/set_auth_user_data_action.dart';
import 'package:redfire/src/auth/constants/auth_provider_names.dart';
import 'package:redfire/src/auth/extensions/auth_extensions.dart';
import 'package:redfire/src/auth/models/apple_id_credential.dart';
import 'package:redfire/src/auth/models/auth_user_data.dart';
import 'package:redfire/src/auth/models/google_sign_in_credential.dart';
import 'package:redfire/src/platform/plugins/wrappers/apple_signin_wrapper.dart';
import 'package:redfire/src/types/redux_service.dart';
import 'package:redfire/types.dart';

class AuthService extends ReduxService {
  AuthService(
      {required FirebaseAuth firebase,
      GoogleSignIn? google,
      SignInWithAppleWrapper? apple})
      : _firebaseAuth = firebase,
        _googleSignIn = google,
        _signInWithAppleWrapper = apple;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn? _googleSignIn;
  final SignInWithAppleWrapper? _signInWithAppleWrapper;

  // Functions to get user details, or throw if there is no current user.
  Future<String> getCurrentIdToken() => _firebaseAuth.currentUser!.getIdToken();
  String getCurrentUserId() => _firebaseAuth.currentUser!.uid;

  // Map FirebaseUser objects emitted by FirebaseAuth to a StoreUser action,
  // which can be dispatched by the store.
  // If the FirebaseUser or the uid field is null, create an empty StoreUser
  // object that will set the user field of the AppState to null.
  Stream<SetAuthUserDataAction> get streamOfSetAuthUserData {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => SetAuthUserDataAction(user?.toModel()));
  }

  Future<AuthUserData> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    final user = userCredential.user!;

    return user.toModel();
  }

  Future<IdTokenResult>? getIdTokenResult() {
    return FirebaseAuth.instance.currentUser?.getIdTokenResult();
  }

  Future<ISet<ProvidersEnum>> retrieveProvidersFor(String email) async {
    var providerNames = await _firebaseAuth.fetchSignInMethodsForEmail(email);
    return providerNames
        .map<ProvidersEnum>((name) => authProviderEnumFrom[name]!)
        .toISet();
  }

  Future<UserCredential> signUpWithEmailAndPassword(
          String email, String password) =>
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

  Future<UserCredential> signInWithEmailAndPassword(
          String email, String password) =>
      _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

  /// `null` in case where sign in process was aborted
  Future<GoogleSignInCredential?> getGoogleCredential() async {
    final googleSignInAccount = await _googleSignIn!.signIn();
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

  Future<AuthUserData> linkGoogle(
      {required GoogleSignInCredential credential}) async {
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: credential.accessToken,
      idToken: credential.idToken,
    );

    var user = FirebaseAuth.instance.currentUser!;
    final userCredential = await user.linkWithCredential(authCredential);
    user = userCredential.user!;

    return user.toModel();
  }

  Future<String> getTokenForGoogle(List<String> scopes) async {
    final googleSignIn = GoogleSignIn(scopes: scopes);
    final googleSignInAccount = await googleSignIn.signIn();
    final googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    return googleSignInAuthentication.accessToken!;
  }

  Future<AppleIdCredential> getAppleCredential() async {
    // By default, scopes = email, fullName
    final appleIdCredential = await _signInWithAppleWrapper!.getCredential();

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
    final user = userCredential.user!;

    return user.toModel();
  }

  Future<UserCredential> signInWithGithubOnWeb() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    // Once signed in, return the UserCredential
    return await _firebaseAuth.signInWithPopup(githubProvider);

    // Or use signInWithRedirect
    // return await _firebaseAuth.signInWithRedirect(githubProvider);
  }

  Future<AuthUserData> signInWithGithub(String token) async {
    final credential = GithubAuthProvider.credential(token);
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    final user = userCredential.user!;

    return user.toModel();
  }

  Future<AuthUserData> linkGithub(String token) async {
    final credential = GithubAuthProvider.credential(token);
    final firebaseUser = _firebaseAuth.currentUser!;
    final userCredential = await firebaseUser.linkWithCredential(credential);
    final user = userCredential.user!;

    return user.toModel();
  }

  /// The stream of auth state is connected to the store at app load so the
  /// app state will be automatically updated.
  Future<void> signOut(ProvidersEnum? signInProvider) async {
    if (signInProvider == ProvidersEnum.google) {
      await _googleSignIn?.signOut();
    }
    await _firebaseAuth.signOut();
  }
}
