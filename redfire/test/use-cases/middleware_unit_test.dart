import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/src/auth/middleware/observe_auth_state_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_apple_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_in_with_google_middleware.dart';
import 'package:redfire/src/auth/middleware/sign_out_middleware.dart';
import 'package:redfire/src/platform/middleware/detect_platform_middleware.dart';
import 'package:redfire/src/platform/middleware/launch_url_middleware.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire_test/redfire_test.dart';

import '../test-doubles/app_state/app_state.dart';

void main() {
  group('Middleware ', () {
    test('ObserveAuthState catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(authService: authServiceMock);
      final middleware = ObserveAuthStateMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(AppState.init());
      final action = ObserveAuthStateAction();

      // Create the error to catch.
      when(authServiceMock.streamOfStoreAuthState).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });

    test('SignInWithApple catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(authService: authServiceMock);
      final middleware = SignInWithAppleMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(AppState.init());
      final action = SignInWithAppleAction();

      // Create the error to catch.
      when(authServiceMock.getAppleCredential()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });

    test('SignInWithGoogle catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(authService: authServiceMock);
      final middleware = SignInWithGoogleMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(AppState.init());
      final action = SignInWithGoogleAction();

      // Create the error to catch.
      when(authServiceMock.getGoogleCredential()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });

    test('SignOut catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(authService: authServiceMock);
      final middleware = SignOutMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(AppState.init());
      final action = SignOutAction();

      // Create the error to catch.
      when(authServiceMock.signOut()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });

    test('DetectPlatform catches error', () {
      // Setup the middleware and mocks.
      final platformServiceMock = MockPlatformService();
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(
          authService: authServiceMock, platformService: platformServiceMock);
      final middleware = DetectPlatformMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(AppState.init());
      final action = DetectPlatformAction();

      // Create the error to catch.
      when(platformServiceMock.detectPlatform()).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });

    test('LaunchUrl catches error', () {
      // Setup the middleware and mocks.
      final platformServiceMock = MockPlatformService();
      RedFireLocator.provide(platformService: platformServiceMock);
      final middleware = LaunchUrlMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(AppState.init());
      final action = LaunchUrlAction(url: 'url');

      // Create the error to catch.
      when(platformServiceMock.launchUrl(action.url)).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last is AddProblemAction, true);
    });
  });
}
