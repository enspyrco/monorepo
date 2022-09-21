import 'package:astro_inspector_screen/src/state/inspector_state.dart';
import 'package:test/test.dart';

void main() {
  test('InspectorState.addMissionEvent throws on invalid input', () {
    var state = InspectorState();
    // expect(() => state.addMissionEvent({}),
    //     throwsA('added json has no `mission` key'));
    // expect(() => missionEvents.add({'mission': 'blah'}),
    // throwsA(isA<_TypeError>()));
  });
}
