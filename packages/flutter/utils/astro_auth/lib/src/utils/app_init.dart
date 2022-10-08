import 'package:astro_locator/astro_locator.dart';

import '../../astro_auth.dart';

void astroAuthInit() async {
  Locator.add<FirebaseAuthService>(FirebaseAuthService());
}
