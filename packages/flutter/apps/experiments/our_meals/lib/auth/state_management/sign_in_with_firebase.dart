import 'package:redaux/redaux.dart';

import '../../app_state.dart';

class SignInWithFirebase extends AsyncAction<AppState> {
  final String idToken;

  SignInWithFirebase({required this.idToken});

  static final Middleware<AppState> _m = SignInWithFirebaseMiddleware();

  @override
  Middleware<AppState>? get middleware => _m;
}

class SignInWithFirebaseMiddleware extends Middleware<AppState> {
  @override
  void call(store, covariant SignInWithFirebase action) {}
}
