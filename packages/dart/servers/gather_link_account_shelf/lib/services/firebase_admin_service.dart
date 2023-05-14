import 'package:firebase_admin/firebase_admin.dart';

class FirebaseAdminService {
  FirebaseAdminService() {
    // applicationDefault() will look for credentials in the following locations:
    // * the env variable GOOGLE_APPLICATION_CREDENTIALS
    // * a configuration file, specific for this library, stored in the user's home directory
    // * gcloud's application default credentials
    // * credentials from the firebase tools
    Credential credential = Credentials.applicationDefault()!;

    // create an app
    _app = FirebaseAdmin.instance.initializeApp(
        AppOptions(credential: credential, projectId: 'gather-identity-link'));
  }

  late final App _app;

  Future<String> mintToken({
    required String uid,
    Map<String, String> developerClaims = const {},
  }) async {
    String token = await _app.auth().createCustomToken(uid, developerClaims);

    return token;
  }
}
