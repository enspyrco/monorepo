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
      final middleware = ObserveAuthStateMiddleware();
      await middleware(
          mockStore, ObserveAuthStateAction(), (dynamic _) => null);

      final data = AuthUserDataExample.normal;
      final action = StoreAuthUserDataAction(data);
      controller.add(action);

      verify<dynamic>(mockStore.dispatch(any));

      // controller.stream.listen(expectAsync1((action) {
      //   expect(action is AddProblem, true);
      //   final addProblemAction = action as AddProblem;
      //   final problemInfo = addProblemAction.problem.info;
      //   expect(problemInfo['type'], UnimplementedError);
      //   expect(problemInfo['location'],
      //       'ConnectAndConvert on FirebaseAuth -> connectAuthStateToStore'); // StoreUserData
      // }, count: 1));
    });
  });
}
