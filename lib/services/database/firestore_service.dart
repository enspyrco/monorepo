import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/enums/database/database_section.dart';
import 'package:flireator/models/credentials/credential_info.dart';
import 'package:flireator/models/flireator/flireator.dart';
import 'package:flireator/services/database/database_service.dart';

class FirestoreService implements DatabaseService {
  /// The [Firestore] instance
  final Firestore _firestore;

  /// The stream of the [_storeController] is used just once on app load, to
  /// connect the [_storeController] to the redux [Store]
  /// Functions that observe parts of the database thus don't return anything,
  /// they just connect the store to the database and keep the subscription so
  /// functions that disregard (stop observing) that part of the database just
  /// cancel the subscription.
  @override
  Stream<ReduxAction> get storeStream => _storeController.stream;

  /// Keep track of the subscriptions so we can cancel them later.
  Map<DatabaseSection, StreamSubscription> subscriptions = {};

  /// The [_storeController] is connected to the redux [Store] via [storeStrea]
  /// and is used by the [DatabaseService] to add actions to the stream where
  /// they will be dispatched by the store.
  final StreamController<ReduxAction> _storeController =
      StreamController<ReduxAction>();

  FirestoreService(Firestore firestore) : _firestore = firestore;

  @override
  Future<String> retrieveStoredToken(String userId) {
    return _firestore
        .document('/users/$userId')
        .get()
        .then((snapshot) => snapshot['gitHubToken'] as String);
  }

  @override
  Future<Flireator> retrieveFlireatorData(String userId) async {
    final docSnapshot =
        await _firestore.document('/users/$userId').snapshots().first;
    return Flireator(
        id: userId,
        displayName: docSnapshot.data['displayName'],
        photoURL: docSnapshot.data['photoURL'],
        credentials: BuiltMap<String, CredentialInfo>({}));
  }
}
