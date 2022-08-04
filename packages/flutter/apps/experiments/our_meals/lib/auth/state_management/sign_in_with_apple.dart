import 'package:enspyr_redux/redux.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../app_state.dart';
import 'sign_in_with_firebase.dart';

class SignInWithAppleAction extends ReduxAction<AppState> {
  static final ReduxMiddleware<AppState> _m = SignInWithAppleMiddleware();
  static const ReduxReducer<AppState>? _r = null;

  @override
  ReduxMiddleware<AppState>? get middleware => _m;

  @override
  ReduxReducer<AppState>? get reducer => _r;
}

class SignInWithAppleMiddleware extends ReduxMiddleware<AppState> {
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
