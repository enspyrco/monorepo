import 'package:locator/locator.dart';

import '../../astro_auth.dart';

void authInit() async {
  Locator.add<FirebaseAuthService>(FirebaseAuthService());
}
