import 'package:astro_locator/astro_locator.dart';
import 'package:astro_navigation/astro_navigation.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../astro_auth.dart';

void initializeAuthPlugin<S extends AstroState>({
  required Widget initialScreen,
  List<AwayMission<S>>? launchOnSignedIn,
  List<LandingMission<S>>? landOnSignedIn,
  List<AwayMission<S>>? launchOnSignedOut,
  List<LandingMission<S>>? landOnSignedOut,
}) {
  /// Add the [OnAuthStateChange] object to the locator, which will be used
  /// to kick off missions at given auth state change events.
  Locator.add<OnAuthStateChange<S>>(
    OnAuthStateChange<S>(
      launchOnSignedIn: launchOnSignedIn,
      landOnSignedIn: landOnSignedIn,
      launchOnSignedOut: launchOnSignedOut,
      landOnSignedOut: landOnSignedOut,
    ),
  );

  /// Start with the AuthGate as the only route in the navigation stack
  Locator.add<S>((locate<S>() as dynamic).copyWith(
      navigation: const DefaultNavigationState(stack: [AuthGatePageState()])));

  locate<PageGenerator>().add(
      type: AuthGatePageState,
      generator: (state) =>
          MaterialPage(child: AuthGateScreen<S>(child: initialScreen)));

  /// Create and add a FirebaseAuthService to the Locator
  Locator.add<FirebaseAuthService>(FirebaseAuthService());
}
