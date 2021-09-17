import 'package:mockito/mockito.dart';
import 'package:redfire/src/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/src/auth/actions/set_auth_user_data_action.dart';
import 'package:redfire/src/auth/middleware/observe_auth_state_middleware.dart';
import 'package:redfire/src/auth/reducers/set_auth_user_data_reducer.dart';
import 'package:redfire/src/redux/extensions/reducers_list_extension.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../../../test-doubles/app_state/app_state.dart';

void main() {
  group('ObserveAuthStateAction', () {
    test('conects FirebaseAuth to the store', () async {
      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfSetAuthUserData).thenAnswer(
        (_) => Stream.fromIterable(
            [SetAuthUserDataAction(AuthUserDataExample.basic)]),
      );

      RedFireLocator.provide(authService: mockAuthService);

      // Create a store with the relevant reducer
      final appReducer =
          <Reducer<AppState>>[SetAuthUserDataReducer<AppState>()].combine();
      final store = Store(appReducer,
          initialState: AppState.init(),
          middleware: <Middleware<AppState>>[
            ObserveAuthStateMiddleware<AppState>()
          ]);

      store.dispatch(ObserveAuthStateAction());
      verify(mockAuthService.streamOfSetAuthUserData);

      // wait for the stream to complete so we can check the middleware did it's thing
      await for (ReduxAction _ in mockAuthService.streamOfSetAuthUserData) {}

      // all the middleware does is dispatch a StoreAuthState action
      expect(store.state.auth.userData!.uid, 'uid');
    });
  });
}
