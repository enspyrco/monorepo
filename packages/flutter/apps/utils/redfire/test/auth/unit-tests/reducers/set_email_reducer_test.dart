import 'package:redfire/src/auth/actions/email/set_email_action.dart';
import 'package:redfire/src/auth/reducers/set_email_reducer.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SetEmailReducer', () {
    test('should correctly set email', () {
      const testEmail = 'asdf@zxcv.com';

      final initialState = ExampleAppState.init();
      expect(initialState.auth.emailVM.email, null);

      final reducer = SetEmailReducer();
      final newState =
          reducer.reducer(initialState, const SetEmailAction(testEmail));

      expect(newState.auth.emailVM.email, equals(testEmail));
    });
  });
}
