import 'package:firebase_auth/firebase_auth.dart';
import 'package:our_meals/auth/services/firebase_auth_service.dart';
import 'package:our_meals/auth/state_management/update_user_state.dart';
import 'package:redaux/redaux.dart';

import '../../app/state/app_state.dart';
import '../state/user_state.dart';

class SignInWithFirebase extends AsyncAction<AppState> {
  SignInWithFirebase({required this.idToken, required this.rawNonce});

  final String idToken;
  final String rawNonce;

  @override
  Middleware<AppState> get middleware => _SignInWithFirebaseMiddleware.instance;

  @override
  toJson({int? parentId}) => {
        'name_': 'Sign In With Firebase',
        'type_': 'async',
        'id_': hashCode,
        'parent_': parentId,
        'state_': <String, dynamic>{'idToken': idToken, 'rawNonce': rawNonce}
      };
}

class _SignInWithFirebaseMiddleware extends Middleware<AppState> {
  @override
  void call(store, covariant SignInWithFirebase action) async {
    UserCredential credential =
        await service.signInToFirebase(action.idToken, action.rawNonce);

    var user =
        credential.user ?? (throw 'Firebase Credential has no "user" member');
    var state = UserState(
        signedIn: SignedInState.signedIn,
        displayName: user.displayName,
        photoUrl: user.photoURL,
        uid: user.uid);

    store.dispatch(UpdateUserState(state)..parent = action);
  }

  final service = FirebaseAuthService(FirebaseAuth.instance);

  static final instance = _SignInWithFirebaseMiddleware();
}
