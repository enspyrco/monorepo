import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flireator/actions/auth/store_user_data.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/problems_utils.dart';

import 'firebase_user_extensions.dart';

extension ConnectAndConvert on FirebaseAuth {
  /// Observe the auth state and convert each [FirebaseUser]
  /// into a [ReduxAction] and send to the store using the passed in [StreamController]
  StreamSubscription<FirebaseUser> connectAuthStateToStore(
      StreamController<ReduxAction> controller) {
    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(controller.add,
        'ConnectAndConvert on FirebaseAuth -> connectAuthStateToStore');

    // listen to the onAuthStateChanged stream, convert events to actions and
    // dispatch to the store with the controller
    return onAuthStateChanged.listen((firebaseUser) {
      try {
        controller.add(StoreUserData(userData: firebaseUser.toData()));
      } catch (error, trace) {
        handleProblem(error, trace);
      }
    }, onError: handleProblem);
  }
}
