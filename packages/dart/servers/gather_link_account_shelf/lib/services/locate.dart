import 'package:firestore_service_googleapis/firestore_service_googleapis.dart';
import 'package:googleapis_auth/auth_io.dart';

import '../config/config.dart' as config;

class Locate {
  const Locate();

  static FirestoreServiceGoogleapis? _firestore;
  static AutoRefreshingAuthClient? _client;

  static FirestoreServiceGoogleapis get firestore => (_firestore == null)
      ? throw 'You attempted to locate the firestore service before it has been provided.\n'
          'Make sure to call a `provideFirestore` function before using the Locate.firestore getter.'
      : _firestore!;

  static AutoRefreshingAuthClient get client => (_client == null)
      ? throw 'You attempted to locate the client before it has been provided.\n'
          'Make sure to call a `provideFirestore` function before using the Locate.client getter.'
      : _client!;

  /// Creates a client that authenticates as the default service account to make
  /// a service that accesses the Firestore. The client can now be located witout error.
  Future<void> provideDefaultFirestore() async {
    if (_firestore == null) {
      _client = await clientViaApplicationDefaultCredentials(scopes: []);
      _firestore = FirestoreServiceGoogleapis(
          client: _client, projectId: config.projectId);
    }
    return;
  }

  Future<void> provideLocalFirestore() async {
    if (_firestore == null) {
      _client = await clientViaApplicationDefaultCredentials(scopes: []);
      _firestore = FirestoreServiceGoogleapis(
          client: _client,
          rootUrl: 'http://localhost:8081/',
          projectId: 'demo-project');
    }
    return;
  }

  /// Set client and firestore, if not already
  void provide(
      {required FirestoreServiceGoogleapis firestore,
      required AutoRefreshingAuthClient client}) {
    _client ??= client;
    _firestore ??= firestore;
  }
}
