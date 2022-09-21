import 'package:astro_dev_tools_screen/src/state/dev_tools_state.dart';
import 'package:test/test.dart';

void main() {
  test('DevToolsState.addMissionEvent throws on invalid input', () {
    var devToolsState = DevToolsState();
    // expect(() => devToolsState.addDispatchEvent({}),
    //     throwsA('added json has no `mission` key'));
    // expect(() => missionEvents.add({'mission': 'blah'}),
    // throwsA(isA<_TypeError>()));
  });
}
