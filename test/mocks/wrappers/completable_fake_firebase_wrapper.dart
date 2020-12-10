import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:the_process/utils/wrappers/firebase_wrapper.dart';

class CompletableFakeFirebaseWrapper implements FirebaseWrapper {
  final Completer<FirebaseApp> _completer;

  CompletableFakeFirebaseWrapper({Completer<FirebaseApp> completer})
      : _completer = completer ?? Completer<FirebaseApp>();

  /// Returns a [Future] that completes when the supplied [Completer] says so
  @override
  Future<FirebaseApp> init() {
    return _completer.future;
  }
}
