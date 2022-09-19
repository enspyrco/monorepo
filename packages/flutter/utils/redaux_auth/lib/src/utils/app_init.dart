import 'package:locator/locator.dart';

import '../../redaux_auth.dart';

void authInit() async {
  Locator.add<FirebaseAuthService>(FirebaseAuthService());
}
