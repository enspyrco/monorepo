import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/types.dart';

import '../../../../redfire_test.dart';

class AuthStateExample {
  static AuthState get authenticated => AuthState(
      userData: AuthUserDataExample.minimal,
      emailVM: EmailAuthVM(),
      linking: LinkAccountsViewModel(IMap()),
      step: AuthStepEnum.waitingForInput);
}
