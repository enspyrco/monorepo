import 'package:astro_inspector_screen/src/state/inspector_state.dart';
import 'package:test/test.dart';

void main() {
  test('InspectorState.addMissionReport throws on invalid input', () {
    var state = InspectorState.initial;
    // expect(() => state.addMissionReport({}),
    //     throwsA('added json has no `mission` key'));
    // expect(() => missionReports.add({'mission': 'blah'}),
    // throwsA(isA<_TypeError>()));
  });
}
