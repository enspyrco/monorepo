import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_google_middleware.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SignInWithGoogleMiddleware', () {
    test('catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(authService: authServiceMock);
      final middleware = SignInWithGoogleMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(ExampleAppState.init());
      const action = SignInWithGoogleAction();

      // Create the error to catch.
      when(authServiceMock.getGoogleCredential()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });

    test('should ', () async {
      final mockStore = MockStore<RedFireState>();

      // Create then invoke the middleware under test.
      final middleware = SignInWithGoogleMiddleware();
      await middleware(mockStore, SignInWithGoogleAction, (dynamic _) => null);
      expect(true, false);
    }, skip: true); // haven't finished the test
  });
}
