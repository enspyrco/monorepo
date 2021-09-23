import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/src/test-doubles/firebase/mocks/firebase_test_doubles.mocks.dart';

/// A fake wrapper that by default returns a [Future<FirebaseAppMock>] when
/// [FirebaseWrapperFake.init] is called or, if a completer was passed in,
/// returns the [Future] of the completer.
class FakeFirebaseWrapper implements FirebaseWrapper {
  final Completer<FirebaseApp>? _completer;

  FakeFirebaseWrapper({Completer<FirebaseApp>? completer})
      : _completer = completer;

  @override
  Future<FirebaseApp> init() {
    return (_completer != null)
        ? _completer!.future
        : Future.value(MockFirebaseApp());
  }
}
