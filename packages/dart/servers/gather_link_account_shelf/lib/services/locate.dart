import 'package:firestore_api_client/firestore_api_client.dart';
import 'package:googleapis_auth/auth_io.dart';

import '../config/config.dart' as config;

class Locate {
  const Locate();

  static GoogleapisFirestoreService? _firestore;

  static GoogleapisFirestoreService get firestore => (_firestore == null)
      ? throw 'You attempted to locate the firestore service before it has been provided.\n'
          'Make sure to call a `provideFirestore` function before using the Locate.firestore getter.'
      : _firestore!;

  Future<GoogleapisFirestoreService> provideDefaultFirestore() async {
    if (_firestore == null) {
      // Use a client that authenticates as the default service account to make
      // a service that accesses the Firestore.
      final client = await clientViaApplicationDefaultCredentials(scopes: []);
      _firestore = GoogleapisFirestoreService(
          client: client, projectId: config.projectId);
    }
    return _firestore!;
  }
}
