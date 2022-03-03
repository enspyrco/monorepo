import 'package:redfire/src/auth/actions/set_auth_user_data_action.dart';
import 'package:redfire/src/auth/reducers/set_auth_user_data_reducer.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SetAuthUserDataReducer', () {
    test('should correctly update the user data', () {
      final initialState = ExampleAppState.init();
      expect(initialState.auth.userData, null);

      final reducer = SetAuthUserDataReducer();
      final newState = reducer.reducer(
          initialState, SetAuthUserDataAction(AuthUserDataExample.basic));

      expect(newState.auth.userData!.uid, equals('uid'));
      expect(newState.auth.userData!.email, equals('email'));
      expect(newState.auth.userData!.photoURL, equals('photoURL'));
      expect(newState.auth.userData!.displayName, equals('displayName'));
    });
  });
}
