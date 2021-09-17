import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/src/platform/middleware/detect_platform_middleware.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('DetectPlatformMiddleware', () {
    test('catches error', () {
      // Setup the middleware and mocks.
      final platformServiceMock = MockPlatformService();
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(
          authService: authServiceMock, platformService: platformServiceMock);
      final middleware = DetectPlatformMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(ExampleAppState.init());
      final action = DetectPlatformAction();

      // Create the error to catch.
      when(platformServiceMock.detectPlatform()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });
  });
}
