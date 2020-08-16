import 'dart:async';

import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/auth/user_data.dart';

/// Implemented by [FirebaseAuthService]
abstract class AuthService {
  Stream<ReduxAction> get storeStream;
  void connectAuthStateToStore();
  void disconnectAuthState();
  Future<String> getCurrentUserId();
  Future<UserData> signInWithApple();
  Future<void> signOut();
}
