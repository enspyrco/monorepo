import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/src/platform/middleware/launch_url_middleware.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('LaunchUrlMiddleware', () {
    test('catches error', () {
      // Setup the middleware and mocks.
      final platformServiceMock = MockPlatformService();
      RedFireLocator.provide(platformService: platformServiceMock);
      final middleware = LaunchUrlMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(ExampleAppState.init());
      const action = LaunchUrlAction(url: 'url');

      // Create the error to catch.
      when(platformServiceMock.launchUrl(action.url)).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });
  });
}
