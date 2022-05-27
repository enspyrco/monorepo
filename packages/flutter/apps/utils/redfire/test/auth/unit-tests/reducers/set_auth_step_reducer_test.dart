import 'package:redfire/src/auth/actions/set_auth_step_action.dart';
import 'package:redfire/src/auth/enums/auth_step_enum.dart';
import 'package:redfire/src/auth/reducers/set_auth_step_reducer.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('SetAuthStepReducer', () {
    test('sets the auth step', () {
      final initialState = ExampleAppState.init();
      expect(initialState.auth.step, AuthStepEnum.waitingForInput);

      final reducer = SetAuthStepReducer();
      final newState =
          reducer.reducer(initialState, SetAuthStepAction.contactingApple());

      expect(newState.auth.step, AuthStepEnum.contactingApple);
    });
  });
}
