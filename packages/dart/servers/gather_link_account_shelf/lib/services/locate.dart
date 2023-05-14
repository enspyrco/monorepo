import 'package:googleapis_auth/auth_io.dart';

import 'firebase_admin_service.dart';

class Locate {
  const Locate();

  static AutoRefreshingAuthClient? _client;
  static FirebaseAdminService? _firebaseAdmin;

  static AutoRefreshingAuthClient get client => (_client == null)
      ? throw 'You attempted to locate the client before it has been provided.\n'
          'Make sure to call a `provideFirestore` function before using the Locate.client getter.'
      : _client!;

  static FirebaseAdminService get firebaseAdmin => (_firebaseAdmin == null)
      ? throw 'You attempted to locate a FirebaseAdminService before it has been provided.\n'
          'Make sure to call a `provide` function before using the Locate.client getter.'
      : _firebaseAdmin!;

  /// Set client and firebase admin, if not already set
  void provideAll({
    required AutoRefreshingAuthClient client,
    required FirebaseAdminService firebaseAdmin,
  }) {
    _client ??= client;
    _firebaseAdmin ??= firebaseAdmin;
  }

  void provideOnly({
    AutoRefreshingAuthClient? client,
    FirebaseAdminService? firebaseAdmin,
  }) {
    if (client != null) _client = client;
    if (firebaseAdmin != null) _firebaseAdmin = firebaseAdmin;
  }

  /// Creates and provides a Firebase Admin Service with the default service account
  void provideDefaultFirebaseAdmin() =>
      _firebaseAdmin ??= FirebaseAdminService();

  // Future<void> provideLocalFirestore() async {
  //   if (_firestore == null) {
  //     _client = await clientViaApplicationDefaultCredentials(scopes: []);
  //     _firestore = FirestoreServiceGoogleapis(
  //         client: _client,
  //         rootUrl: 'http://localhost:8081/',
  //         projectId: 'demo-project');
  //   }
  //   return;
  // }
}
