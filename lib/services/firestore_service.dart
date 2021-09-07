import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class FirestoreService {
  late final FirestoreApi _api;
  FirestoreService({required FirestoreApi api}) : _api = api;

  /// Async factory that awaits an authenticated client
  static Future<FirestoreService> create() async {
    AutoRefreshingAuthClient client =
        await clientViaApplicationDefaultCredentials(scopes: []);
    return FirestoreService(api: FirestoreApi(client));
  }
}
