import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:googleapis/firestore/v1.dart' as v1;
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:googleapis_utils/googleapis_utils.dart';
import 'package:json_utils/json_utils.dart';

import 'document.dart';

/// If [api] is omitted, [client] is used to create one (using [rootUrl] if present), so [client] must be present.
/// If [api] is present, [client] & [rootUrl] will be ignored and should be ommited.
///
/// The main purpose of [rootUrl] is to make a service use the emulator while under testing.
class FirestoreServiceGoogleapis implements FirestoreService {
  FirestoreServiceGoogleapis(
      {required String projectId,
      AutoRefreshingAuthClient? client,
      String? rootUrl,
      v1.FirestoreApi? api})
      : _databaseName = 'projects/' + projectId + '/databases/(default)' {
    _api = api ??
        ((rootUrl == null)
            ? v1.FirestoreApi(client!)
            : v1.FirestoreApi(client!, rootUrl: rootUrl));
    _docs = _api.projects.databases.documents;
  }

  final String _databaseName;
  late final v1.FirestoreApi _api;
  late final v1.ProjectsDatabasesDocumentsResource _docs;

  /// From FirestoreService interface:
  ///
  /// Add a document with the given data at the given path and return the document
  /// id. If the document already exists an exception is thrown.
  ///
  /// Relevant endpoint: https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents/createDocument
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

  /// From FirestoreService interface:
  ///
  /// Takes a [JsonMap] and the path where it should be saved
  ///
  /// If the document exists, its contents will be overwritten with the newly
  /// provided json, unless "merge = true", whereby [json] is merged into the
  /// existing document.
  ///
  /// If the document does not exist, it will be created.
  ///
  /// Relevant endpoint: https://cloud.google.com/firestore/docs/reference/rest/v1/projects.databases.documents/patch
  @override
  Future<Document> setDocument({
    required String at,
    required JsonMap to,
    bool merge = false,
  }) async {
    var doc =
        await _docs.patch(to.toDocument(), _databaseName + '/documents/' + at);

    return doc.toOurDocument();
  }

  /// From FirestoreService interface:
  ///
  /// Relevant endpoint:
  @override
  Future<void> deleteDocument({required String at}) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
  }

  /// From FirestoreService interface:
  ///
  /// Relevant endpoint:
  @override
  Future<void> updateDocument({required String at, required JsonMap to}) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }

  /// From FirestoreService interface:
  ///
  /// Relevant endpoint:
  @override
  Future<List<Document>> getDocuments(
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
      bool? isNull}) async {
    // if (isEqualTo != null) addCondition(field, '==', isEqualTo);
    // if (isNotEqualTo != null) addCondition(field, '!=', isNotEqualTo);
    // if (isLessThan != null) addCondition(field, '<', isLessThan);
    // if (isLessThanOrEqualTo != null) {
    //   addCondition(field, '<=', isLessThanOrEqualTo);
    // }
    // if (isGreaterThan != null) addCondition(field, '>', isGreaterThan);
    // if (isGreaterThanOrEqualTo != null) {
    //   addCondition(field, '>=', isGreaterThanOrEqualTo);
    // }
    // if (arrayContains != null) {
    //   addCondition(field, 'array-contains', arrayContains);
    // }
    // if (arrayContainsAny != null) {
    //   addCondition(field, 'array-contains-any', arrayContainsAny);
    // }
    // if (whereIn != null) addCondition(field, 'in', whereIn);
    // if (whereNotIn != null) addCondition(field, 'not-in', whereNotIn);
    // if (isNull != null) {
    //   if (isNull == true) {
    //     addCondition(field, '==', null);
    //   } else {
    //     addCondition(field, '!=', null);
    //   }
    // }

    v1.Filter filter;
    if (isEqualTo != null) {
      filter = v1.Filter()
        ..fieldFilter = (v1.FieldFilter()
          ..field = (v1.FieldReference()..fieldPath = where.toString())
          ..op = 'EQUAL'
          ..value = isEqualTo.toValue());
    } else {
      filter = v1.Filter();
    }

    var response = await _docs.runQuery(
        v1.RunQueryRequest()
          ..structuredQuery = (v1.StructuredQuery()
            ..from = [v1.CollectionSelector()..collectionId = at]
            ..where = filter),
        _databaseName + '/documents');

    // The response can come back with items that have null doc member
    response.removeWhere((e) => e.document == null);

    return response
        .toList()
        .map<Document>((e) => DocumentGoogleApis.from(e.document!))
        .toList();
  }

  /// From FirestoreService interface:
  ///
  /// Relevant endpoint:
  @override
  Stream<List<Document>> tapIntoCollection(
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

  /// From FirestoreService interface:
  ///
  /// Relevant endpoint:
  @override
  Stream<Document> tapIntoDocument({required String at}) {
    // TODO: implement tapDocument
    throw UnimplementedError();
  }
}
