import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';

import '../firebase/firebase_test_doubles.mocks.dart';

/// Returns a [FirebaseAppMock] when [FirebaseWrapperFake.init] is called
class FakeFirebaseWrapper implements FirebaseWrapper {
  @override
  Future<FirebaseApp> init() {
    return Future.value(MockFirebaseApp());
  }
}
