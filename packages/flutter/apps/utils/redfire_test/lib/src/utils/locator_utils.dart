import 'package:redfire/services.dart';

import '../test-doubles/services/mocks/service_test_doubles.mocks.dart';

void provideDefaultMockServices() {
  RedFireLocator.provide(
      authService: MockAuthService(),
      firestoreService: MockFlutterfireFirestoreService(),
      platformService: MockPlatformService());
}
