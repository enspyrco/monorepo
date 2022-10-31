import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/app/state/app_state.dart';
import 'package:the_process/sections/missions/update_new_section_v_m.dart';

void main() {
  group('UpdateNewSectionVMReducer', () {
    test('correctly updates new section name', () {
      // Setup app state and check expected values
      final initialState = AppState.initial;
      expect(initialState.sections.newName, '');

      const mission = UpdateNewSectionVM(name: 'testy');

      final newState = mission.landingInstructions(initialState);

      expect(newState.sections.newName, 'testy');
    });
  });
}
