import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';

void main() {
  group('UpdateNewSectionVMReducer', () {
    test('correctly updates new section name', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.initial;
      expect(initialState.sections.newName, '');

      final reducerUnderTest = UpdateNewSectionVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(
          initialState, const UpdateNewSectionVMAction(name: 'testy'));

      expect(newState.sections.newName, 'testy');
    });
  });
}
