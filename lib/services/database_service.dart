import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:the_process/actions/profile/store_profile_data.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/actions/sections/store_sections.dart';
import 'package:the_process/actions/sections/update_new_section_v_m.dart';
import 'package:the_process/enums/auth/authorization_step.dart';
import 'package:the_process/enums/auth/provider.dart';
import 'package:the_process/enums/database/database_section.dart';
import 'package:the_process/extensions/firestore_extensions.dart';
import 'package:the_process/extensions/stream_extensions.dart';
import 'package:the_process/models/sections/section.dart';

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
      await _firestore.doc('profiles/$uid').set(<String, Object>{
        'accessToken': accessToken,
        'refreshToken': refreshToken
      }, SetOptions(merge: true));
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }

  Future<void> updateAuthorizationStep(
      {@required Provider provider,
      @required String uid,
      @required AuthorizationStep step}) async {
    assert(uid != null);

    try {
      await _firestore.doc('profiles/$uid').set(
          <String, Object>{'${provider}Auth': step.toString()},
          SetOptions(merge: true));
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }

  Future<void> createSection(
      {@required String uid,
      @required String name,
      @required int number}) async {
    assert(uid != null);

    try {
      await _firestore.doc('new/$uid').set(<String, Object>{
        'section': {
          'name': name,
          'number': number,
        }
      });

      final dbSection = DatabaseSection.newEntries;
      subscriptions[dbSection] =
          _firestore.doc('new/$uid').snapshots().listen((doc) {
        try {
          if (!doc.exists) {
            _controller.add(UpdateNewSectionVM(creating: false));
            subscriptions[dbSection].cancel();
          }
        } catch (error, trace) {
          _controller.addProblem(error, trace);
          subscriptions[dbSection].cancel();
        }
      }, onError: _controller.addProblem, cancelOnError: true);
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }

  /// Observe the collection at /sections/ and convert each
  /// [CollectionSnapshot] into a [ReduxAction] then send to the store using the
  /// passed in [StreamController].
  void connectSections() {
    final dbSection = DatabaseSection.sections;

    try {
      // connect the database to the store and keep the subscription
      subscriptions[dbSection] = _firestore
          .collection('sections')
          .snapshots()
          .listen((collectionSnapshot) {
        try {
          final list = <Section>[];
          for (final querySnapshot in collectionSnapshot.docs) {
            list.add(querySnapshot.toSection());
          }
          _controller.add(StoreSections(list: BuiltList<Section>(list)));
        } catch (error, trace) {
          _controller.addProblem(error, trace);
        }
      }, onError: _controller.addProblem);
    } catch (error, trace) {
      _controller.addProblem(error, trace);
    }
  }
}
