// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:redfire_test/src/test-doubles/firebase/firebase_test_doubles.mocks.dart';

// /// A fake [FirebaseAuth] that takes a [StreamController<User>] that allows
// /// auth state events to be emitted during tests.
// class FakeFirebaseAuth extends Fake implements FirebaseAuth {
//   final StreamController<User> _authStateEventsController;

//   FakeFirebaseAuth({StreamController<User>? authStateEventsController})
//       : _authStateEventsController =
//             authStateEventsController ?? StreamController<User>();

//   @override
//   Stream<User> authStateChanges() => _authStateEventsController.stream;

//   void emit({User? user}) => _authStateEventsController.add(user ?? MockUser());
// }
