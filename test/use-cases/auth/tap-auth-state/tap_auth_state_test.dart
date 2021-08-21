import 'package:mockito/mockito.dart';
import 'package:redfire/src/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/src/auth/actions/store_auth_user_data_action.dart';
import 'package:redfire/src/auth/reducers/store_auth_user_data_reducer.dart';
import 'package:redfire/src/auth/services/auth_service.dart';
import 'package:redfire/src/redux/extensions/reducers_list_extension.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../../../test-doubles/app_state/app_state.dart';

void main() {
  group('AuthService', () {
    test('_observeAuthState listens to stream and emits actions', () async {
      final stubbedAuthService = AuthService(
          firebase: MockFirebaseAuth(),
          google: MockGoogleSignIn(),
          apple: MockSignInWithAppleWrapper());

      stubbedAuthService.streamOfStoreAuthState;

      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfStoreAuthState).thenAnswer(
        (_) => Stream.fromIterable(
            [StoreAuthUserDataAction(AuthUserDataExample.basic)]),
      );

      RedFireLocator.provide(authService: mockAuthService);
      final appReducer =
          <Reducer<AppState>>[StoreAuthUserDataReducer<AppState>()].combine();
      final store = Store(appReducer, initialState: AppState.init());

      store.dispatch(ObserveAuthStateAction());
      verify(mockAuthService.streamOfStoreAuthState);

      // wait for the stream to complete so we can check the middleware did it's thing
      await for (ReduxAction _ in mockAuthService.streamOfStoreAuthState) {}

      // all the middleware does is dispatch a StoreAuthState action
      expect(store.state.auth.userData!.uid, 'id');
    });
  });
}
