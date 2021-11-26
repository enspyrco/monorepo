import 'package:coding_challenge_verifier/utils/type_utils.dart';
import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

/// If [api] is omitted, [client] is used to create one, so [client] must be present.
/// If [api] is present, [client] can be ommited.
class FirestoreService {
  FirestoreService(
      {required String projectId,
      AutoRefreshingAuthClient? client,
      FirestoreApi? api})
      : _databaseName = 'projects/' + projectId + '/databases/(default)' {
    _api = api ?? FirestoreApi(client!);
    _docs = _api.projects.databases.documents;
  }

  final String _databaseName;
  late final FirestoreApi _api;
  late final ProjectsDatabasesDocumentsResource _docs;

  Future<Document> setDocument(
          {required String at, required JsonMap to}) async =>
      _docs.createDocument(
        to.toDocument(),
        _databaseName + '/documents',
        at,
      );
}
