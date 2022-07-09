import 'typedefs.dart';

abstract class FirestoreService {
  /// Get the documents in the collection at [path],
  /// converting each document in the returned [QuerySnapshot] into a [JsonMap]
  /// The document id is added to the json.
  Future<JsonList> getDocuments({
    required String at,
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
    bool? isNull,
  });

  // Add a document with the given data at the given path and return the
  // document id.
  Future<String> createDocument({required String at, required JsonMap from});

  /// Takes a [JsonMap] and the path where it should be saved
  ///
  /// If the document exists, its contents will be overwritten with the newly
  /// provided json, unless "merge = true", whereby [json] is merged into the
  /// existing document.
  ///
  /// If the document does not exist, it will be created.
  Future<void> setDocument(
      {required String at, required JsonMap to, bool merge = false});

  /// Takes a [JsonMap] consisting of the members to be updated and the path.
  ///
  /// Updates the fields of the document without overwriting the entire document.
  ///
  /// If the document does not exist, an error is produced.
  Future<void> updateDocument({required String at, required JsonMap to});

  /// Delete the document at the given location.
  Future<void> deleteDocument({required String at});

  /// Tap the database to create a stream from the document at [path],
  /// converting the data in each [DocumentSnapshot] into a [JsonMap]
  Stream<JsonMap> tapDocument({required String at});

  /// Tap the database to create a stream from the collection at [path],
  /// converting the data in each [QuerySnapshot] into a [JsonMap]
  /// The document id is added to the json.
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
      bool? isNull});
}
