import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/sections/actions/update_sections_v_m_action.dart';
import 'package:the_process/sections/reducers/update_sections_v_m_reducer.dart';

void main() {
  group('UpdateSectionsVMReducer', () {
    test('correctly updates creatingNewSection flag', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.init();
      expect(initialState.sections.creatingNewSection, false);

      final reducerUnderTest = UpdateSectionsVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(
          initialState, const UpdateSectionsVMAction(creatingNewSection: true));

      expect(newState.sections.creatingNewSection, true);
    });
  });
}
