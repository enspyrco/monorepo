import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/main.dart';
import 'package:the_process/sections/actions/update_new_section_v_m_action.dart';
import 'package:the_process/sections/reducers/update_new_section_v_m_reducer.dart';

void main() {
  group('UpdateNewSectionVMReducer', () {
    test('correctly updates new section name', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.init();
      expect(initialState.sections.newName, '');

      final reducerUnderTest = UpdateNewSectionVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(
          initialState, UpdateNewSectionVMAction(name: 'testy'));

      expect(newState.sections.newName, 'testy');
    });
  });
}
