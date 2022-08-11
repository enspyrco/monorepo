import 'enums/provider_enum.dart';
import 'models/auth_user_data.dart';
import 'models/id_token_result.dart';
import 'models/provider_credential.dart';
import 'models/user_credential.dart';

abstract class FirebaseAuthService {
  // Functions to get user details, or throw if there is no current user.
  Future<String> getCurrentIdToken();
  String getCurrentUserId();

  Stream<AuthUserData> get streamOfAuthUserData;

  Future<AuthUserData> signInAnonymously();

  Future<IdTokenResult>? getIdTokenResult();

  Future<Set<ProviderEnum>> retrieveProvidersFor(String email);

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password);

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);

  Future<AuthUserData> signIn(
      {required ProviderEnum provider, required ProviderCredential credential});

  Future<AuthUserData> link(
      {required ProviderEnum provider, required ProviderCredential credential});

  /// If a provider is passed, the user will be signed out of the provider then
  /// out of FirebaseAuth.
  Future<void> signOut({ProviderEnum? provider});
}
