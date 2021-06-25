import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

/// A fake [FirebaseFirestore] that can be used to emit given data at any point.
///
/// Only partly implemented, can be added to as more use cases are required.
class FakeFirebaseFirestore extends Fake implements FirebaseFirestore {
  final _sectionsController =
      StreamController<QuerySnapshot<Map<String, dynamic>>>();

  @override
  CollectionReference<Map<String, dynamic>> collection(String collectionPath) {
    if (collectionPath == 'sections') {
      return CollectionReferenceFake(snapshotsController: _sectionsController);
    } else {
      throw 'Only sections collections have been implemented';
    }
  }

  void emitSectionsSnapshot() {
    final fakeSnapshot = FakeQueryDocumentSnapshot(data: <String, dynamic>{
      'name': 'nameroo',
      'folderId': 'idOfYoLife',
      'useCasesDocId': 'theDocId'
    });

    _sectionsController.add(FakeQuerySnapshot(docs: [fakeSnapshot]));
  }

  @override
  bool operator ==(dynamic o) =>
      o is FirebaseFirestore && o.app.name == app.name;
}

/// A fake [CollectionReference] that takes a [StreamController], allowing for
/// events to be emitted during tests.
class CollectionReferenceFake extends Fake
    implements CollectionReference<Map<String, dynamic>> {
  final StreamController<QuerySnapshot<Map<String, dynamic>>>
      _snapshotsController;

  CollectionReferenceFake(
      {StreamController<QuerySnapshot<Map<String, dynamic>>>?
          snapshotsController})
      : _snapshotsController = snapshotsController ??
            StreamController<QuerySnapshot<Map<String, dynamic>>>();

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> snapshots(
          {bool includeMetadataChanges = false}) =>
      _snapshotsController.stream;

  @override
  bool operator ==(dynamic o) =>
      o is CollectionReference && o.firestore == firestore && o.path == path;
}

/// A fake [QuerySnapshot] that holds a list of [QueryDocumentSnapshot].
class FakeQuerySnapshot extends Fake
    implements QuerySnapshot<Map<String, dynamic>> {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> _docs;
  FakeQuerySnapshot({List<QueryDocumentSnapshot<Map<String, dynamic>>>? docs})
      : _docs = docs ?? [];

  @override
  List<QueryDocumentSnapshot<Map<String, dynamic>>> get docs => _docs;
}

/// A fake [QueryDocumentSnapshot] that holds the data [DocumentSnapshot] data.
class FakeQueryDocumentSnapshot extends Fake
    implements QueryDocumentSnapshot<Map<String, dynamic>> {
  final String _id;
  final bool _exists;
  final Map<String, dynamic> _data;

  FakeQueryDocumentSnapshot(
      {String? id, bool? exists, Map<String, dynamic>? data})
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
