import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/project_sections/update_project_sections_v_m_action.dart';
import 'package:the_process/main.dart';
import 'package:the_process/reducers/sections/update_project_sections_v_m.dart';

void main() {
  group('UpdateSectionsVMReducer', () {
    test('correctly updates creatingNewSection flag', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.init();
      expect(initialState.sections.creatingNewSection, false);

      final reducerUnderTest = UpdateProjectSectionsVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(initialState,
          UpdateProjectSectionsVMAction(creatingNewSection: true));

      expect(newState.sections.creatingNewSection, true);
    });
  });
}
