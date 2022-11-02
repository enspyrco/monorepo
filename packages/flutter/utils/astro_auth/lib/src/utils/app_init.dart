import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/state_types.dart';

import '../../astro_auth.dart';

void astroAuthInit<S extends AstroState>({
  List<AwayMission<S>>? launchOnSignedIn,
  List<LandingMission<S>>? landOnSignedIn,
  List<AwayMission<S>>? launchOnSignedOut,
  List<LandingMission<S>>? landOnSignedOut,
}) async {
  Locator.add<FirebaseAuthService>(FirebaseAuthService());
  Locator.add<OnAuthStateChangeMissions<S>>(OnAuthStateChangeMissions<S>(
    launchOnSignedIn: launchOnSignedIn,
    landOnSignedIn: landOnSignedIn,
    launchOnSignedOut: launchOnSignedOut,
    landOnSignedOut: landOnSignedOut,
  ));
}
