library firestore_service_flutterfire;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_service_flutterfire/cloud_firestore_extensions.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:json_types/json_types.dart';

class FirestoreServiceFlutterfire implements FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreServiceFlutterfire({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Add a document with the given data at the given path and return the
  // document id.
  @override
  Future<String> createDocument(
      {required String at, required JsonMap from}) async {
    final ref = await _firestore.collection(at).add(from);
    return ref.id;
  }

  /// Get the documents in the collection at [path],
  /// converting each document in the returned [QuerySnapshot] into a [JsonMap]
  /// The document id is added to the json.
  @override
  Future<List<Document>> getDocuments({
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
  }) async {
    if (where == null) {
      var snapshot = await _firestore.collection(at).get();
      return snapshot.docs.toDocuments();
    } else {
      var snapshot = await _firestore
          .collection(at)
          .where(
            where,
            isEqualTo: isEqualTo,
            isNotEqualTo: isNotEqualTo,
            isLessThan: isLessThan,
            isLessThanOrEqualTo: isLessThanOrEqualTo,
            isGreaterThan: isGreaterThan,
            isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
            arrayContains: arrayContains,
            arrayContainsAny: arrayContainsAny,
            whereIn: whereIn,
            whereNotIn: whereNotIn,
            isNull: isNull,
          )
          .get();
      return snapshot.docs.toDocuments();
    }
  }

  /// Takes a [JsonMap] and the path where it should be saved
  ///
  /// If the document exists, its contents will be overwritten with the newly
  /// provided json, unless "merge = true", whereby [json] is merged into the
  /// existing document.
  ///
  /// If the document does not exist, it will be created.
  @override
  Future<void> setDocument(
      {required String at, required JsonMap to, bool merge = false}) async {
    return await _firestore.doc(at).set(to);
  }

  /// Takes a [JsonMap] consisting of the members to be updated and the path.
  ///
  /// Updates the fields of the document without overwriting the entire document.
  ///
  /// If the document does not exist, an error is produced.
  @override
  Future<void> updateDocument({required String at, required JsonMap to}) async {
    return await _firestore.doc(at).update(to);
  }

  /// Delete the document at the given location.
  @override
  Future<void> deleteDocument({required String at}) async {
    return await _firestore.doc(at).delete();
  }

  /// Tap the firestore to create a stream from the document at [path],
  /// converting the data in each [DocumentSnapshot] into a [JsonMap]
  @override
  Stream<Document> tapIntoDocument({required String at}) {
    return _firestore.doc(at).snapshots().map((event) => event.toDocument());
  }

  /// Tap the firestore to create a stream from the collection at [path],
  /// converting the data in each [QuerySnapshot] into a [JsonMap]
  /// The document id is added to the json.
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
    return (where == null)
        ? _firestore
            .collection(at)
            .snapshots()
            .map((event) => event.docs.toDocuments())
        : _firestore
            .collection(at)
            .where(
              where,
              isEqualTo: isEqualTo,
              isNotEqualTo: isNotEqualTo,
              isLessThan: isLessThan,
              isLessThanOrEqualTo: isLessThanOrEqualTo,
              isGreaterThan: isGreaterThan,
              isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
              arrayContains: arrayContains,
              arrayContainsAny: arrayContainsAny,
              whereIn: whereIn,
              whereNotIn: whereNotIn,
              isNull: isNull,
            )
            .snapshots()
            .map((event) => event.docs.toDocuments());
  }
}
