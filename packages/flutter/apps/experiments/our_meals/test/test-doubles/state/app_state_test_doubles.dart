/// See: Astro Test Utils > AppState Test Doubles
/// - https://www.notion.so/enspyrco/AppState-Test-Doubles-90620189e74e4173a29e8aa6c0d4fd3d

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:astro_types/auth_types.dart';
import 'package:our_meals/app/state/app_state.dart';

AppState initialAppState = GeneratedAppState(
  navigation: DefaultNavigationState.initial,
  auth: AuthStateTestDouble(
    user: UserAuthStateTestDouble(signedIn: SignedInState.checking),
  ),
  error: DefaultErrorHandlingState.initial,
);

AppState signedInAppState = GeneratedAppState(
  navigation: DefaultNavigationState.initial,
  auth: AuthStateTestDouble(
    user: UserAuthStateTestDouble(signedIn: SignedInState.signedIn, uid: 'uid'),
  ),
  error: DefaultErrorHandlingState.initial,
);
