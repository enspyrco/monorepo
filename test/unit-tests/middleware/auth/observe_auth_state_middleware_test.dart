import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/src/auth/middleware/observe_auth_state_middleware.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

import '../../../test-doubles/app_state/app_state.dart';

void main() {
  group('ObserveAuthStateMiddleware', () {
    test(
        'should listen to AuthService.streamOfStoreAuthState and dispatch emitted actions',
        () async {
      final mockStore = MockStore<AppState>();
      when<dynamic>(mockStore.dispatch(any)).thenReturn(null);
      final controller = StreamController<ReduxAction>();
      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfStoreAuthState)
          .thenAnswer((_) => controller.stream);

      RedFireLocator.provide(authService: mockAuthService);

      // Create then invoke the middleware under test.
      await ObserveAuthStateMiddleware()(
          mockStore, ObserveAuthStateAction(), emptyAppReducer);

      final data = AuthUserDataExample.normal;
      final action = StoreAuthUserDataAction(data);
      controller.add(action);

      await untilCalled<dynamic>(mockStore.dispatch(action));
    });

    // We can't verify [store.dispatchProblem] (as it is an extension member)
    // so we use the FakeStore and listen for dispatched actions.
    test('should dispatch a problem if store throws', () async {
      // Setup and provide a mock auth service
      final controller = StreamController<ReduxAction>();
      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfStoreAuthState)
          .thenAnswer((_) => controller.stream);
      RedFireLocator.provide(authService: mockAuthService);

      final fakeStore = FakeStore(AppState.init());

      await ObserveAuthStateMiddleware()(
          fakeStore, ObserveAuthStateAction(), emptyAppReducer);

      // Setup the FakeStore to throw when asked to dispatch action.
      final action = StoreAuthUserDataAction(AuthUserDataExample.normal);
      fakeStore.throwOn(action);

      // Simulate an auth state change by making the mock auth service emit a StoreAuthStateAction
      controller.add(action);

      // Check that an AddProblemAction was dispatched.
      expect(fakeStore.dispatches,
          emitsInOrder(<dynamic>[isA<AddProblemAction>()]));
    });
  });
}
