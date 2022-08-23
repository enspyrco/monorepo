import 'package:redaux/redaux.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;

import '../../app_state.dart';
import 'sign_in_with_firebase.dart';

class SignInWithApple extends AsyncAction<AppState> {
  static final Middleware<AppState> _m = SignInWithAppleMiddleware();

  @override
  Middleware<AppState>? get middleware => _m;

  @override
  final List<AsyncAction> history = [];
}

class SignInWithAppleMiddleware extends Middleware<AppState> {
  @override
  void call(store, covariant SignInWithApple action) async {
    final plugin.AuthorizationCredentialAppleID credential =
        await plugin.SignInWithApple.getAppleIDCredential(
      scopes: [
        plugin.AppleIDAuthorizationScopes.email,
        plugin.AppleIDAuthorizationScopes.fullName,
      ],
    );

    var token = credential.identityToken ?? (throw 'a');

    store.dispatch(SignInWithFirebase(idToken: token));
  }
}
