import 'package:deploy_coverage/utils/locator.dart';
import 'package:test/test.dart';

void main() {
  group('Locator', () {
    test('retrieves the system env var if none has been set', () {
      String homeEnvVar = Locator.getEnvVar('HOME');
      print(homeEnvVar);
      expect(homeEnvVar, isNotEmpty);
    });

    test('retrieves the relevant env var if set using Locator', () {
      Locator.setEnvVar('HOME', 'boopboop');
      String homeEnvVar = Locator.getEnvVar('HOME');
      print(homeEnvVar);
      expect(homeEnvVar, 'boopboop');
    });
  });
}
