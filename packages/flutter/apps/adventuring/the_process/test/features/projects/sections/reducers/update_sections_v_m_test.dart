import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';

void main() {
  group('UpdateSectionsVMReducer', () {
    test('correctly updates creatingNewSection flag', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.initial;
      expect(initialState.sections.creatingNewSection, false);

      final reducerUnderTest = UpdateSectionsVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(
          initialState, const UpdateSectionsVMAction(creatingNewSection: true));

      expect(newState.sections.creatingNewSection, true);
    });
  });
}
