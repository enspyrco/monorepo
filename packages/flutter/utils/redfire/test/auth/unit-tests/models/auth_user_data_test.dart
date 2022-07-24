import 'package:redfire/src/auth/models/auth_provider_data.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('AuthUserData', () {
    test('.hasGitHub checks providerId and providers list', () {
      final authUserData = AuthUserDataExample.normal;
      expect(authUserData.hasGitHub, false);

      final authUserData2 = authUserData.copyWith(
          providers: authUserData.providers.add(AuthProviderData(
              providerId: 'github.com',
              uid: 'uid2',
              displayName: null,
              photoURL: null,
              email: null,
              phoneNumber: null)));

      expect(authUserData2.hasGitHub, true);
    });
  });
}
