import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

/// A fake [FirebaseFirestore] that can be used to emit given data at any point.
///
/// Only partly implemented, can be added to as more use cases are required.
class FakeFirebaseFirestore extends Fake implements FirebaseFirestore {
  final _sectionsController = StreamController<QuerySnapshot>();

  @override
  CollectionReference collection(String collectionPath) {
    if (collectionPath == 'sections') {
      return FakeCollectionReference(snapshotsController: _sectionsController);
    }
    return null;
  }

  void emitSectionsSnapshot() {
    final fakeSnapshot = FakeQueryDocumentSnapshot(data: <String, dynamic>{
      'name': 'nameroo',
      'folderId': 'idOfYoLife',
      'useCasesDocId': 'theDocId'
    });

    _sectionsController.add(FakeQuerySnapshot(docs: [fakeSnapshot]));
  }
}

/// A fake [CollectionReference] that takes a [StreamController], allowing for
/// events to be emitted during tests.
class FakeCollectionReference extends Fake implements CollectionReference {
  final StreamController<QuerySnapshot> _snapshotsController;

  FakeCollectionReference({StreamController<QuerySnapshot> snapshotsController})
      : _snapshotsController =
            snapshotsController ?? StreamController<QuerySnapshot>();

  @override
  Stream<QuerySnapshot> snapshots({bool includeMetadataChanges = false}) =>
      _snapshotsController.stream;
}

/// A fake [QuerySnapshot] that holds a list of [QueryDocumentSnapshot].
class FakeQuerySnapshot extends Fake implements QuerySnapshot {
  final List<QueryDocumentSnapshot> _docs;
  FakeQuerySnapshot({List<QueryDocumentSnapshot> docs}) : _docs = docs ?? [];

  @override
  List<QueryDocumentSnapshot> get docs => _docs;
}

/// A fake [QueryDocumentSnapshot] that holds the data [DocumentSnapshot] data.
class FakeQueryDocumentSnapshot extends Fake implements QueryDocumentSnapshot {
  final String _id;
  final bool _exists;
  final Map<String, dynamic> _data;

  FakeQueryDocumentSnapshot({String id, bool exists, Map<String, dynamic> data})
      : _id = id ?? 'id',
        _exists = exists ?? true,
        _data = data ?? <String, dynamic>{};

  @override
  String get id => _id;

  @override
  bool get exists => _exists;

  /// Contains all the data of this [DocumentSnapshot].
  @override
  Map<String, dynamic> data() => _data;
}
