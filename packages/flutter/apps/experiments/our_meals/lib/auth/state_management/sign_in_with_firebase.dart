import 'package:enspyr_redux/redux.dart';

import '../../app_state.dart';

class SignInWithFirebaseAction extends ReduxAction<AppState> {
  final String idToken;

  SignInWithFirebaseAction({required this.idToken});

  static final ReduxMiddleware<AppState> _m = SignInWithFirebaseMiddleware();
  static const ReduxReducer<AppState>? _r = null;

  @override
  ReduxMiddleware<AppState>? get middleware => _m;

  @override
  ReduxReducer<AppState>? get reducer => _r;
}

class SignInWithFirebaseMiddleware extends ReduxMiddleware<AppState> {
  @override
  void call(store, covariant SignInWithFirebaseAction action) {}
}
