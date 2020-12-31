import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/sections/update_sections_v_m.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/reducers/sections/update_sections_v_m.dart';

void main() {
  group('UpdateSectionsVMReducer', () {
    test('correctly updates creatingNewSection flag', () {
      // Setup the initial app state and check expected values are present
      final initialState = AppState.init();
      expect(initialState.sections?.creatingNewSection, false);

      final reducerUnderTest = UpdateSectionsVMReducer();

      // Invoke the reducer to update the app state.
      final newState = reducerUnderTest.reducer(
          initialState, UpdateSectionsVM(creatingNewSection: true));

      expect(newState.sections?.creatingNewSection, true);
    });
  });
}
