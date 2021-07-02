import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../types/typedefs.dart';

class DatabaseService {
  final FirebaseFirestore _firestore;

  DatabaseService({FirebaseFirestore? database})
      : _firestore = database ?? FirebaseFirestore.instance;

  // Add a document with the given data at the given path and return the
  // document id.
  Future<String> createDocumentAt(
      {required String path, required JsonMap jsonData}) async {
    final ref = await _firestore.collection(path).add(jsonData);
    return ref.id;
  }
  // TODO: use set/update in a single 'update' function with set/merge options?
  // - need to read up on how each one works
  // /// Takes a [ReduxModel] and the path where it should be saved
  // Future<void> setDocumentAt(
  //     {required String path, required ReduxModel entry}) async {
  //   return await _firestore.doc(path).set(entry.toJson());
  // }

  // /// Takes a [JsonMap] consisting of the members to be updated and the values
  // Future<void> updateDocumentAt(
  //     {required String path, required JsonMap updates}) async {
  //   return await _firestore.doc(path).update(updates);
  // }

  /// Tap the database to create a stream from the document at [path],
  /// converting the data in each [DocumentSnapshot] into a [JsonMap]
  Stream<JsonMap> tapDocumentAt({required String path}) {
    return _firestore.doc(path).snapshots().map((event) => event.data() ?? {});
  }

  /// Tap the database to create a stream from the collection at [path],
  /// converting the data in each [QuerySnapshot] into a [JsonMap]
  Stream<ListOfJsonMap> tapCollectionAt({required String path}) {
    return _firestore
        .collection(path)
        .snapshots()
        .map((event) => event.docs.map((doc) => doc.data()).toList());
  }
}
