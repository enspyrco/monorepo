import 'package:redfire/src/auth/actions/set_auth_step_action.dart';
import 'package:redfire/src/auth/actions/set_auth_user_data_action.dart';
import 'package:redfire/src/auth/enums/auth_step_enum.dart';
import 'package:redfire/src/auth/reducers/set_auth_step_reducer.dart';
import 'package:redfire/src/auth/reducers/set_auth_user_data_reducer.dart';
import 'package:redfire/src/problems/actions/add_problem_action.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/reducers/add_problem_reducer.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

import '../../test-doubles/app_state/app_state.dart';

void main() {
  group('StoreAuthUserDataReducer', () {
    test('should correctly update the user data', () {
      final initialState = AppState.init();
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

  group('AddProblemReducer', () {
    test('adds to the list', () {
      final initialState = AppState.init();
      expect(initialState.problems, <ProblemInfo>[]);

      final reducer = AddProblemReducer();
      final newState = reducer.reducer(
          initialState, AddProblemAction(ProblemInfo('m', 'trace')));

      expect(newState.problems.length, 1);
      final problem = newState.problems.first;
      expect(problem.message, 'm');
      expect(problem.trace, 'trace');
    });
  });

  group('StoreAuthStep', () {
    test('stores the auth step', () {
      final initialState = AppState.init();
      expect(initialState.auth.step, AuthStepEnum.waitingForInput);

      final reducer = SetAuthStepReducer();
      final newState =
          reducer.reducer(initialState, SetAuthStepAction.contactingApple());

      expect(newState.auth.step, AuthStepEnum.contactingApple);
    });
  });
}
