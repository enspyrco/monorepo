import 'package:locator/locator.dart';

import '../../astro_auth.dart';

void astroAuthInit() async {
  Locator.add<FirebaseAuthService>(FirebaseAuthService());
}
