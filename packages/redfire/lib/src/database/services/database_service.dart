import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../types/typedefs.dart';

class DatabaseService {
  final FirebaseFirestore _firestore;

  DatabaseService({FirebaseFirestore? database})
      : _firestore = database ?? FirebaseFirestore.instance;

  // Add a document with the given data at the given path and return the
  // document id.
  Future<String> createDocument(
      {required String at, required JsonMap from}) async {
    final ref = await _firestore.collection(at).add(from);
    return ref.id;
  }

  /// Takes a [JsonMap] and the path where it should be saved
  ///
  /// If the document exists, its contents will be overwritten with the newly
  /// provided json, unless "merge = true", whereby [json] is merged into the
  /// existing document.
  ///
  /// If the document does not exist, it will be created.
  Future<void> setDocument(
      {required String at, required JsonMap to, bool merge = false}) async {
    return await _firestore.doc(at).set(to);
  }

  /// Takes a [JsonMap] consisting of the members to be updated and the path.
  ///
  /// Updates the fields of the document without overwriting the entire document.
  ///
  /// If the document does not exist, an error is produced.
  Future<void> updateDocument({required String at, required JsonMap to}) async {
    return await _firestore.doc(at).update(to);
  }

  /// Tap the database to create a stream from the document at [path],
  /// converting the data in each [DocumentSnapshot] into a [JsonMap]
  Stream<JsonMap> tapDocument({required String at}) {
    return _firestore.doc(at).snapshots().map((event) => event.data() ?? {});
  }

  /// Tap the database to create a stream from the collection at [path],
  /// converting the data in each [QuerySnapshot] into a [JsonMap]
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
    return (where == null)
        ? _firestore
            .collection(at)
            .snapshots()
            .map((event) => event.docs.map((doc) => doc.data()).toList())
        : _firestore
            .collection(at)
            .where(where,
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
                isNull: isNull)
            .snapshots()
            .map((event) =>
                event.docs.map((doc) => doc.data()..['id'] = doc.id).toList());
  }
}
