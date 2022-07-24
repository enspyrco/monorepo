// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';

// /// A fake [FirebaseFirestore] that can be used to emit given data at any point.
// class FakeFirebaseFirestore extends Fake implements FirebaseFirestore {
//   final _snapshotsController =
//       StreamController<QuerySnapshot<JsonMap>>();

//   @override
//   CollectionReference<JsonMap> collection(String collectionPath) {
//     return FakeCollectionReference(snapshotsController: _snapshotsController);
//   }

//   void emitSectionsSnapshot() {
//     final fakeSnapshot = FakeQueryDocumentSnapshot(data: <String, dynamic>{
//       'name': 'nameroo',
//       'folderId': 'idOfYoLife',
//       'useCasesDocId': 'theDocId'
//     });

//     _snapshotsController.add(FakeQuerySnapshot(docs: [fakeSnapshot]));
//   }
// }

// // ignore: subtype_of_sealed_class
// /// A fake [CollectionReference] that takes a [StreamController], allowing for
// /// events to be emitted during tests.
// class FakeCollectionReference extends Fake
//     implements CollectionReference<JsonMap> {
//   final StreamController<QuerySnapshot<JsonMap>>
//       _snapshotsController;

//   FakeCollectionReference(
//       {StreamController<QuerySnapshot<JsonMap>>?
//           snapshotsController})
//       : _snapshotsController = snapshotsController ??
//             StreamController<QuerySnapshot<JsonMap>>();

//   @override
//   Stream<QuerySnapshot<JsonMap>> snapshots(
//           {bool includeMetadataChanges = false}) =>
//       _snapshotsController.stream;
// }

// /// A fake [QuerySnapshot] that holds a list of [QueryDocumentSnapshot].
// class FakeQuerySnapshot extends Fake
//     implements QuerySnapshot<JsonMap> {
//   final List<QueryDocumentSnapshot<JsonMap>> _docs;
//   FakeQuerySnapshot({List<QueryDocumentSnapshot<JsonMap>>? docs})
//       : _docs = docs ?? [];

//   @override
//   List<QueryDocumentSnapshot<JsonMap>> get docs => _docs;
// }

// // ignore: subtype_of_sealed_class
// /// A fake [QueryDocumentSnapshot] that holds the data [DocumentSnapshot] data.
// class FakeQueryDocumentSnapshot extends Fake
//     implements QueryDocumentSnapshot<JsonMap> {
//   final String _id;
//   final bool _exists;
//   final JsonMap _data;

//   FakeQueryDocumentSnapshot(
//       {String? id, bool? exists, JsonMap? data})
//       : _id = id ?? 'id',
//         _exists = exists ?? true,
//         _data = data ?? <String, dynamic>{};

//   @override
//   String get id => _id;

//   @override
//   bool get exists => _exists;

//   /// Contains all the data of this [DocumentSnapshot].
//   @override
//   JsonMap data() => _data;
// }
