import 'package:astro_inspector_screen/src/state/inspector_state.dart';
import 'package:test/test.dart';

void main() {
  test('InspectorState.addMissionUpdate throws on invalid input', () {
    var state = InspectorState.initial;
    // expect(() => state.addMissionUpdate({}),
    //     throwsA('added json has no `mission` key'));
    // expect(() => missionUpdates.add({'mission': 'blah'}),
    // throwsA(isA<_TypeError>()));
  });
}
