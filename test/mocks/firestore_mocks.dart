import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/src/firebase_app.dart';

class FakeFirestore implements Firestore {
  @override
  // TODO: implement app
  FirebaseApp get app => throw UnimplementedError();

  @override
  WriteBatch batch() {
    // TODO: implement batch
    throw UnimplementedError();
  }

  @override
  CollectionReference collection(String path) {
    // TODO: implement collection
    throw UnimplementedError();
  }

  @override
  Query collectionGroup(String path) {
    // TODO: implement collectionGroup
    throw UnimplementedError();
  }

  @override
  DocumentReference document(String path) {
    // TODO: implement document
    throw UnimplementedError();
  }

  @override
  Future<void> enablePersistence(bool enable) {
    // TODO: implement enablePersistence
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> runTransaction(transactionHandler,
      {Duration timeout = const Duration(seconds: 5)}) {
    // TODO: implement runTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> settings(
      {bool persistenceEnabled,
      String host,
      bool sslEnabled,
      int cacheSizeBytes}) {
    // TODO: implement settings
    throw UnimplementedError();
  }
}
