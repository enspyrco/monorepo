import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/src/auth/middleware/observe_auth_state_middleware.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('ObserveAuthStateMiddleware', () {
    test('catches error', () {
      // Setup the middleware and mocks.
      final authServiceMock = MockAuthService();
      RedFireLocator.provide(authService: authServiceMock);
      final middleware = ObserveAuthStateMiddleware();

      // Create the middleware dependencies.
      final fakeStore = FakeStore(ExampleAppState.init());
      const action = ObserveAuthStateAction();

      // Create the error to catch.
      when(authServiceMock.streamOfSetAuthUserData).thenThrow('error');

      // Call the middleware.
      middleware.call(fakeStore, action, (dynamic _) => null);

      // Error should be caught and AddProblemAction dispatched.
      expect(fakeStore.dispatched.last, isA<AddProblemAction>());
    });

    test(
        'should listen to AuthService.streamOfStoreAuthState and dispatch emitted actions',
        () async {
      final mockStore = MockStore<ExampleAppState>();
      when<dynamic>(mockStore.dispatch(any)).thenReturn(null);
      final controller = StreamController<SetAuthUserDataAction>();
      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfSetAuthUserData)
          .thenAnswer((_) => controller.stream);

      RedFireLocator.provide(authService: mockAuthService);

      // Create then invoke the middleware under test.
      await ObserveAuthStateMiddleware()(
          mockStore, const ObserveAuthStateAction(), emptyAppReducer);

      final data = AuthUserDataExample.normal;
      final action = SetAuthUserDataAction(data);
      controller.add(action);

      await untilCalled<dynamic>(mockStore.dispatch(action));
    });

    // We can't verify [store.dispatchProblem] (as it is an extension member)
    // so we use the FakeStore and listen for dispatched actions.
    test('should dispatch a problem if store throws', () async {
      // Setup and provide a mock auth service
      final controller = StreamController<SetAuthUserDataAction>();
      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfSetAuthUserData)
          .thenAnswer((_) => controller.stream);
      RedFireLocator.provide(authService: mockAuthService);

      final fakeStore = FakeStore(ExampleAppState.init());

      await ObserveAuthStateMiddleware()(
          fakeStore, const ObserveAuthStateAction(), emptyAppReducer);

      // Setup the FakeStore to throw when asked to dispatch action.
      final action = SetAuthUserDataAction(AuthUserDataExample.normal);
      fakeStore.throwOn(action);

      // Simulate an auth state change by making the mock auth service emit a StoreAuthStateAction
      controller.add(action);

      // Check that an AddProblemAction was dispatched.
      expect(fakeStore.dispatches,
          emitsInOrder(<dynamic>[isA<AddProblemAction>()]));
    });
  });
}
