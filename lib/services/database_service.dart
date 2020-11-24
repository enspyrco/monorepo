import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:the_process/actions/profile/store_profile_data.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/database/database_section.dart';
import 'package:the_process/extensions/firestore_extensions.dart';
import 'package:the_process/extensions/stream_extensions.dart';

class DatabaseService {
  /// The [FirebaseFirestore] instance
  final FirebaseFirestore _firestore;

  /// The stream of the [_storeController] is used just once on app load, to
  /// connect the [_storeController] to the redux [Store]
  /// Functions that observe parts of the database thus don't return anything,
  /// they just connect the store to the database and keep the subscription so
  /// functions that disregard (stop observing) that part of the database just
  /// cancel the subscription.
  Stream<ReduxAction> get storeStream => _controller.stream;

  /// Keep track of the subscriptions so we can cancel them later.
  Map<DatabaseSection, StreamSubscription> subscriptions = {};

  /// The [_storeController] is connected to the redux [Store] via [storeStrea]
  /// and is used by the [DatabaseService] to add actions to the stream where
  /// they will be dispatched by the store.
  final StreamController<ReduxAction> _controller =
      StreamController<ReduxAction>();

  DatabaseService(FirebaseFirestore firestore) : _firestore = firestore;

  /// Observe the document at /adventurers/${uid} and convert each
  /// [DocumentSnapshot] into a [ReduxAction] then send to the store using the
  /// passed in [StreamController].
  void connectProfileData({@required String uid}) {
    assert(uid != null);

    final dbSection = DatabaseSection.profileData;

    try {
      // connect the database to the store and keep the subscription
      subscriptions[dbSection] =
          _firestore.doc('profiles/$uid').snapshots().listen((docSnapshot) {
        try {
          if (docSnapshot.exists) {
            _controller
                .add(StoreProfileData(data: docSnapshot.toProfileData()));
          }
        } catch (error, trace) {
          _controller.addProblem(error, trace);
        }
      }, onError: _controller.addProblem);
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }

  void disconnect(DatabaseSection dbSection) =>
      subscriptions[dbSection]?.cancel();

  Future<void> saveAuthTokens(
      {@required String uid,
      @required String accessToken,
      @required String refreshToken}) async {
    assert(uid != null);

    try {
      await _firestore.doc('profiles/$uid').set(
          {'accessToken': accessToken, 'refreshToken': refreshToken},
          SetOptions(merge: true));
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }

  Future<void> updateGoogleAuthorization(
      {@required String uid,
      @required AuthorizationStep step,
      @required bool authorized}) async {
    assert(uid != null);

    try {
      await _firestore
          .doc('profiles/$uid')
          .set({'googleAuth': step.toString()}, SetOptions(merge: true));
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }
}
