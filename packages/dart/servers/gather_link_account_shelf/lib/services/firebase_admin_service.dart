import 'package:firebase_admin/firebase_admin.dart';

class FirebaseAdminService {
  static Future<FirebaseAdminService> asyncCreation() async {
    // applicationDefault() will look for credentials in the following locations:
    // * the env variable GOOGLE_APPLICATION_CREDENTIALS
    // * a configuration file, specific for this library, stored in the user's home directory
    // * gcloud's application default credentials
    // * credentials from the firebase tools
    Credential credential = (await Credentials.applicationDefault())!;

    // create an app
    final app = await FirebaseAdmin.instance.initializeApp(
        AppOptions(credential: credential, projectId: 'gather-identity-link'));

    return FirebaseAdminService._(app);
  }

  FirebaseAdminService._(App app) : _app = app;

  late final App _app;

  Future<String> mintToken({
    required String uid,
    Map<String, String> developerClaims = const {},
  }) async {
    String token = await _app.auth().createCustomToken(uid, developerClaims);

    return token;
  }
}
