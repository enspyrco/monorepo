import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';

import '../firebase/firebase_app_mock.dart';

/// Returns a [FirebaseAppMock] when [FirebaseWrapperFake.init] is called
class FirebaseWrapperFake implements FirebaseWrapper {
  @override
  Future<FirebaseApp> init() {
    return Future.value(FirebaseAppMock());
  }
}
