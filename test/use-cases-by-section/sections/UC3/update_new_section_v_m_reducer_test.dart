import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/sections/update_new_section_v_m_action.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/reducers/sections/update_new_section_v_m.dart';

void main() {
  group('UpdateNewSectionVMReducer', () {
    test('correctly updates new section name', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.init();
      expect(initialState.sections.newSection.name, '');

      final reducerUnderTest = UpdateNewSectionVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(
          initialState, UpdateNewSectionVMAction(name: 'testy'));

      expect(newState.sections.newSection.name, 'testy');
    });
  });
}
