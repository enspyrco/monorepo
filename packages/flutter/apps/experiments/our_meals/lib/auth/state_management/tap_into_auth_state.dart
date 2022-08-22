import 'dart:async';

import 'package:redaux/redaux.dart';

import '../../app_state.dart';
import '../../utils/locate.dart';
import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

class TapIntoAuthStateAction extends Action<AppState> {
  const TapIntoAuthStateAction();
  static final Middleware<AppState> _m = TapIntoAuthStateMiddleware();
  static const Reducer<AppState>? _r = null;

  @override
  Middleware<AppState>? get middleware => _m;

  @override
  Reducer<AppState>? get reducer => _r;
}

class TapIntoAuthStateMiddleware extends Middleware<AppState> {
  StreamSubscription<UserState>? subscription;

  @override
  void call(store, action) {
    var service = locate<FirebaseAuthService>();

    subscription = service
        .tapIntoAuthState()
        .listen((user) => store.dispatch(UpdateUserStateAction(user)));
  }
}
