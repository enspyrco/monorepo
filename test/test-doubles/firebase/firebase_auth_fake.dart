import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'user_fake.dart';
import 'user_metadata_fake.dart';

/// A fake [FirebaseAuth] that takes a [StreamController<User>] that allows
/// auth state events to be emitted during tests.
class FirebaseAuthFake extends Fake implements FirebaseAuth {
  final StreamController<User> _authStateEventsController;

  FirebaseAuthFake({StreamController<User>? authStateEventsController})
      : _authStateEventsController =
            authStateEventsController ?? StreamController<User>();

  @override
  Stream<User> authStateChanges() => _authStateEventsController.stream;

  void emitUser() {
    _authStateEventsController.add(UserFake(
        uid: 'uid',
        metadata:
            UserMetadataFake(creationTimestamp: 1000, lastSignInTime: 1000),
        providerData: [],
        isAnonymous: false,
        emailVerified: false));
  }
}
