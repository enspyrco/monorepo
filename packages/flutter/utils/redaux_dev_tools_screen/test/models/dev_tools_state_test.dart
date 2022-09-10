import 'package:redaux_dev_tools_screen/src/state/dev_tools_state.dart';
import 'package:test/test.dart';

void main() {
  test('DevToolsState.addDispatchEvent throws on invalid input', () {
    var devToolsState = DevToolsState();
    // expect(() => devToolsState.addDispatchEvent({}),
    //     throwsA('added json has no `action` key'));
    // expect(() => dispatchEvents.add({'action': 'blah'}),
    // throwsA(isA<_TypeError>()));
  });
}
