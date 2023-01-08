import 'package:astro_types/auth_types.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_auth_state_flutterfire.dart';

extension UserExtension on User? {
  UserAuthStateFlutterfire toState() {
    return UserAuthStateFlutterfire(
        signedIn:
            (this == null) ? SignedInState.notSignedIn : SignedInState.signedIn,
        uid: this?.uid,
        displayName: this?.displayName,
        photoURL: this?.photoURL);
  }
}
