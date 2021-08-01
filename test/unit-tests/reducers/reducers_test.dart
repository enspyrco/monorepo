import 'package:redfire/src/auth/actions/store_auth_step_action.dart';
import 'package:redfire/src/auth/actions/store_auth_user_data_action.dart';
import 'package:redfire/src/auth/enums/authentication_enum.dart';
import 'package:redfire/src/auth/reducers/store_auth_step_reducer.dart';
import 'package:redfire/src/auth/reducers/store_auth_user_data_reducer.dart';
import 'package:redfire/src/problems/actions/add_problem_action.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/reducers/add_problem_reducer.dart';
import 'package:redfire/src/settings/actions/store_theme_mode_action.dart';
import 'package:redfire/src/settings/reducers/store_theme_mode_reducer.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

import '../../test-doubles/app_state/app_state.dart';

void main() {
  group('StoreAuthUserDataAction', () {
    test('stores auth user data', () {
      final initialState = AppState.init();
      expect(initialState.auth.userData, null);

      final reducer = StoreAuthUserDataReducer();
      final newState = reducer.reducer(
          initialState, StoreAuthUserDataAction(AuthUserDataExample.basic));

      expect(newState.auth.userData!.uid, equals('uid'));
      expect(newState.auth.userData!.email, equals('email'));
      expect(newState.auth.userData!.photoURL, equals('url'));
      expect(newState.auth.userData!.displayName, equals('name'));
    });
  });

  group('AddProblemReducer', () {
    test('adds to the list', () {
      final initialState = AppState.init();
      expect(initialState.problems, []);

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
      expect(initialState.auth.step, AuthenticationEnum.checking);

      final reducer = StoreAuthStepReducer();
      final newState =
          reducer.reducer(initialState, StoreAuthStepAction.contactingApple());

      expect(newState.auth.step, AuthenticationEnum.contactingApple);
    });
  });

  group('StoreThemeModeReducer', () {
    test('correctly stores themeMode', () {
      final initialState = AppState.init();
      expect(initialState.settings.brightnessMode, 0);

      final reducer = StoreThemeModeReducer();
      final newState = reducer.reducer(initialState, StoreThemeModeAction(1));

      expect(newState.settings.brightnessMode, 1);
    });
  });
}
