import 'dart:async';

import 'package:enspyr_redux/redux.dart';

import '../../app_state.dart';
import '../../utils/locate.dart';
import '../services/firebase_auth_service.dart';
import '../state/user_state.dart';
import 'update_user_state.dart';

class TapIntoAuthStateAction extends ReduxAction<AppState> {
  const TapIntoAuthStateAction();
  static final ReduxMiddleware<AppState> _m = TapIntoAuthStateMiddleware();
  static const ReduxReducer<AppState>? _r = null;

  @override
  ReduxMiddleware<AppState>? get middleware => _m;

  @override
  ReduxReducer<AppState>? get reducer => _r;
}

class TapIntoAuthStateMiddleware extends ReduxMiddleware<AppState> {
  StreamSubscription<UserState>? subscription;

  @override
  void call(store, action) {
    var service = locate<FirebaseAuthService>();

    subscription = service
        .tapIntoAuthState()
        .listen((user) => store.dispatch(UpdateUserStateAction(user)));
  }
}
