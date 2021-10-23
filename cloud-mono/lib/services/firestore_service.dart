import 'package:coding_challenge_verifier/utils/type_utils.dart';
import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class FirestoreService {
  FirestoreService(AutoRefreshingAuthClient client,
      {required String projectId, FirestoreApi? api})
      : _databaseName = 'projects/' + projectId + '/databases/(default)' {
    const backendDefine = String.fromEnvironment('BACKEND');
    // store the passed api or create one
    _api = api ??
        // connect to the local emulator if relevant dart define is present
        ((backendDefine == 'EMULATOR')
            ? FirestoreApi(client, rootUrl: 'http://localhost:8081/')
            : FirestoreApi(client));
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
