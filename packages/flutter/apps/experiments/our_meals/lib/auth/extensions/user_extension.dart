import 'package:firebase_auth/firebase_auth.dart';

import '../state/user_state.dart';

extension UserExtension on User? {
  UserState toReduxState() {
    return UserState(
        signedIn:
            (this == null) ? SignedInState.notSignedIn : SignedInState.signedIn,
        uid: this?.uid,
        displayName: this?.displayName,
        photoUrl: this?.photoURL);
  }
}
