import 'package:redaux/redaux.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../app_state.dart';
import 'sign_in_with_firebase.dart';

class SignInWithAppleAction extends Action<AppState> {
  static final Middleware<AppState> _m = SignInWithAppleMiddleware();
  static const Reducer<AppState>? _r = null;

  @override
  Middleware<AppState>? get middleware => _m;

  @override
  Reducer<AppState>? get reducer => _r;
}

class SignInWithAppleMiddleware extends Middleware<AppState> {
  @override
  void call(store, covariant SignInWithAppleAction action) async {
    final AuthorizationCredentialAppleID credential =
        await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    var token = credential.identityToken ?? (throw 'a');

    store.dispatch(SignInWithFirebaseAction(idToken: token));
  }
}
