import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

import 'user_metadata_mocks.dart';
import 'user_mocks.dart';

/// A fake [FirebaseAuth] that takes a [StreamController<User>] that allows
/// auth state events to be emitted during tests.
class FakeFirebaseAuth extends Fake implements FirebaseAuth {
  final StreamController<User> _authStateEventsController;

  FakeFirebaseAuth({StreamController<User> authStateEventsController})
      : _authStateEventsController =
            authStateEventsController ?? StreamController<User>();

  @override
  Stream<User> authStateChanges() => _authStateEventsController.stream;

  void emitUser() {
    _authStateEventsController.add(FakeUser(
        uid: 'uid',
        metadata: FakeUserMetada(creationTimestamp: 1000, lastSignInTime: 1000),
        providerData: [],
        isAnonymous: false,
        emailVerified: false));
  }
}
