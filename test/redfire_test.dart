import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/auth/actions/observe_auth_state_action.dart';

void main() {
  test('description', () {
    final action = ObserveAuthStateAction();
    return expect(action.toJson(), {});
  });
}
