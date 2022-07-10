import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:json_utils/json_utils.dart';

import 'extensions/json_map_extension.dart';

/// If [api] is omitted, [client] is used to create one (using [rootUrl] if present), so [client] must be present.
/// If [api] is present, [client] & [rootUrl] will be ignored and should be ommited.
///
/// The main purpose of [rootUrl] is to make a service use the emulator while under testing.
class GoogleapisFirestoreService implements FirestoreService {
  GoogleapisFirestoreService(
      {required String projectId,
      AutoRefreshingAuthClient? client,
      String? rootUrl,
      FirestoreApi? api})
      : _databaseName = 'projects/' + projectId + '/databases/(default)' {
    _api = api ??
        ((rootUrl == null)
            ? FirestoreApi(client!)
            : FirestoreApi(client!, rootUrl: rootUrl));
    _docs = _api.projects.databases.documents;
  }

  final String _databaseName;
  late final FirestoreApi _api;
  late final ProjectsDatabasesDocumentsResource _docs;

  // See: https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents/createDocument
  @override
  Future<String> createDocument(
      {required String at, required JsonMap from}) async {
    var doc = await _docs.createDocument(
      from.toDocument(),
      _databaseName + '/documents',
      at,
    );
    return Uri.parse(doc.name!).pathSegments.last;
  }

  // See: https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents/patch
  @override
  Future<void> setDocument({
    required String at,
    required JsonMap to,
    bool merge = false,
  }) async {
    _docs.patch(to.toDocument(), _databaseName + '/documents/' + at);
  }

  @override
  Future<void> deleteDocument({required String at}) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
  }

  @override
  Future<void> updateDocument({required String at, required JsonMap to}) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }

  @override
  Future<JsonList> getDocuments(
      {required String at,
      Object? where,
      Object? isEqualTo,
      Object? isNotEqualTo,
      Object? isLessThan,
      Object? isLessThanOrEqualTo,
      Object? isGreaterThan,
      Object? isGreaterThanOrEqualTo,
      Object? arrayContains,
      List<Object?>? arrayContainsAny,
      List<Object?>? whereIn,
      List<Object?>? whereNotIn,
      bool? isNull}) {
    // TODO: implement getDocuments
    throw UnimplementedError();
  }

  @override
  Stream<JsonList> tapCollection(
      {required String at,
      Object? where,
      Object? isEqualTo,
      Object? isNotEqualTo,
      Object? isLessThan,
      Object? isLessThanOrEqualTo,
      Object? isGreaterThan,
      Object? isGreaterThanOrEqualTo,
      Object? arrayContains,
      List<Object?>? arrayContainsAny,
      List<Object?>? whereIn,
      List<Object?>? whereNotIn,
      bool? isNull}) {
    // TODO: implement tapCollection
    throw UnimplementedError();
  }

  @override
  Stream<JsonMap> tapDocument({required String at}) {
    // TODO: implement tapDocument
    throw UnimplementedError();
  }
}
