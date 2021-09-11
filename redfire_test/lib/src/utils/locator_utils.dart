import 'package:redfire/services.dart';
import 'package:redfire_test/src/test-doubles/services/mocks/service_test_doubles.mocks.dart';

void provideDefaultMockServices() {
  RedFireLocator.provide(
      authService: MockAuthService(),
      databaseService: MockDatabaseService(),
      platformService: MockPlatformService());
}
