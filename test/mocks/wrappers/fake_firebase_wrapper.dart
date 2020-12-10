import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';

import '../plugins/mock_firebase_app.dart';

/// Returns a [MockFirebaseApp] when [FakeFirebaseWrapper.init] is called
class FakeFirebaseWrapper implements FirebaseWrapper {
  @override
  Future<FirebaseApp> init() {
    return Future.value(MockFirebaseApp());
  }
}
