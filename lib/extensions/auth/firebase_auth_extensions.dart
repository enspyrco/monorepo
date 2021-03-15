import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/actions/auth/store_auth_data_action.dart';
import 'package:flireator/actions/redux_action.dart';

import 'package:flireator/extensions/dart/stream_controller_extensions.dart';

import 'firebase_user_extensions.dart';

extension ConnectAndConvert on FirebaseAuth {
  /// Observe the auth state and convert each [FirebaseUser]
  /// into a [ReduxAction] and send to the store using the passed in [StreamController]
  ///
  /// Listen to the onAuthStateChanged stream, convert events to actions and
  /// dispatch to the store with the controller.
  StreamSubscription<User?> connectAuthStateToStore(
          StreamController<ReduxAction> controller) =>
      authStateChanges().listen((firebaseUser) {
        try {
          controller.add(StoreAuthDataAction(data: firebaseUser?.toData()));
        } catch (error, trace) {
          controller.addProblem(error, trace);
        }
      }, onError: controller.addProblem);
}
