import 'package:astro_types/auth_types.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../state/default_user_state.dart';

extension UserExtension on User? {
  DefaultUserState toState() {
    return DefaultUserState(
        signedIn:
            (this == null) ? SignedInState.notSignedIn : SignedInState.signedIn,
        uid: this?.uid,
        displayName: this?.displayName,
        photoURL: this?.photoURL);
  }
}
