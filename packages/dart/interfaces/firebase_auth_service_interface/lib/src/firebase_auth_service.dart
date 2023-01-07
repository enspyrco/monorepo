import 'package:astro_types/auth_types.dart';

import 'enums/provider_enum.dart';

/// This interface is currently only used in atro_auth
/// - this will change but for now we can design the API without worrying about
///   what the changes will do to dependents
/// TODO: Remove this comment when the initial version of the API is finalised
abstract class FirebaseAuthService {
  // Functions to get user details if there is a signed in user
  Future<String>? getCurrentIdToken();
  String? getCurrentUserId();

  Future<Set<ProviderEnum>> retrieveProvidersFor(String email);

  Stream<UserAuthState> get onAuthStateChange;

  Future<UserAuthState> signInAnonymously();

  Future<UserAuthState> signUpWithEmailAndPassword(
      String email, String password);

  Future<UserAuthState> signInWithEmailAndPassword(
      String email, String password);

  Future<UserAuthState> signInWithApple(
      {required String idToken, required String rawNonce});

  Future<UserAuthState> signInWithGoogle(
      {required String accessToken, required String idToken});

  Future<void> signOut();

  Future<UserAuthState> linkGoogleAccount(
      {required String accessToken, required String idToken});

  Future<UserAuthState> linkAppleAccount(
      {required String idToken, required String rawNonce});
}
