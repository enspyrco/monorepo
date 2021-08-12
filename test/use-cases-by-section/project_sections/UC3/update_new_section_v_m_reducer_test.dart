import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/project_sections/update_new_project_section_v_m_action.dart';
import 'package:the_process/main.dart';
import 'package:the_process/reducers/sections/update_new_project_section_v_m.dart';

void main() {
  group('UpdateNewSectionVMReducer', () {
    test('correctly updates new section name', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.init();
      expect(initialState.sections.newName, '');

      final reducerUnderTest = UpdateNewProjectSectionVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(
          initialState, UpdateNewProjectSectionVMAction(name: 'testy'));

      expect(newState.sections.newName, 'testy');
    });
  });
}
