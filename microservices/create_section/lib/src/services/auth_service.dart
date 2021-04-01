import 'package:create_section/src/services/firestore_service.dart';
import 'package:googleapis/secretmanager/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/io_client.dart' as http;
import 'package:create_section/src/extensions/models/google_user_credentials_extensions.dart';
import 'package:create_section/src/extensions/googleapis/secret_payload_extensions.dart';

class AuthService {
  AuthService();

  /// Retrieve [GoogleUserCredentials] from the firestore & the project
  /// credentials secret with secretmanagerApi.
  ///
  /// Convert to [GoogleUserCredentials] to [AccessCredentials] and the project
  /// credentials to a [ClientId].
  ///
  /// Combine [ClientId] & [AccessCredentials] to create [AutoRefreshingAuthClient].
  Future<AutoRefreshingAuthClient> getUserClient(
      String userId,
      FirestoreService firestoreService,
      SecretManagerApi secretmanagerApi) async {
    // Retrieve user credentials from the firestore
    final googleUserCredentials =
        await firestoreService.getGoogleUserCredentials(userId);

    // Retrieve project credentials json from secretmanager
    final accessSecretVersionResponse = await secretmanagerApi
        .projects.secrets.versions
        .access('projects/256145062869/secrets/auth-providers/versions/latest');

    // Use ClientId & AccessCredentials to create the AutoRefreshingAuthClient.
    return autoRefreshingClient(
        accessSecretVersionResponse.payload!.toClientId(),
        googleUserCredentials.toAccessCredentials(),
        http.IOClient());
  }
}
