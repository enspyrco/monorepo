import 'package:redaux/redaux.dart';

import '../../app_state.dart';

class SignInWithFirebaseAction extends Action<AppState> {
  final String idToken;

  SignInWithFirebaseAction({required this.idToken});

  static final Middleware<AppState> _m = SignInWithFirebaseMiddleware();
  static const Reducer<AppState>? _r = null;

  @override
  Middleware<AppState>? get middleware => _m;

  @override
  Reducer<AppState>? get reducer => _r;
}

class SignInWithFirebaseMiddleware extends Middleware<AppState> {
  @override
  void call(store, covariant SignInWithFirebaseAction action) {}
}
