import 'dart:async';

import 'package:redaux/redaux.dart';

import '../../app_state.dart';
import '../../utils/locate.dart';
import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

class BindAuthState extends AsyncAction<AppState> {
  static final Middleware<AppState> _m = BindAuthStateMiddleware();

  @override
  Middleware<AppState>? get middleware => _m;
}

class BindAuthStateMiddleware extends Middleware<AppState> {
  StreamSubscription<UserState>? subscription;

  @override
  void call(store, action) {
    var service = locate<FirebaseAuthService>();

    subscription = service
        .tapIntoAuthState()
        .listen((user) => store.dispatch(UpdateUserState(user)));
  }
}
