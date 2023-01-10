import 'package:astro_auth/astro_auth.dart';
import 'package:astro_types/auth_types.dart';
import 'package:our_meals/app/state/app_state.dart';

import '../generated/user_auth_state.dart';

/// It would be great to be able to put this in `astro_test_utils` but
/// I don't know how to extend [AppState] outside of the package where it is
/// defined (this package in this case)

/// [withFakeSignIn] adds the minimum needed to satisfy most checks that there
/// is a signed in user. A common use case is to avoid the [SignInScreen] that
/// otherwise would build on app load.
extension AppStateTestExtensions on AppState {
  AppState get withFakeSignIn {
    /// TODO: Move this to `astro_test_utils` rather than repeating in each package
    final fake =
        UserAuthStateTestDouble(uid: 'uid', signedIn: SignedInState.signedIn);
    return copyWith(auth: auth.copyWith(user: fake));
  }
}
