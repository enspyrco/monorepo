import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/app_state.dart';

void main() {
  test('description', () {
    final state = AppState.init();
    print(state is AppState);
    print(state is RedFireState);
    return expect(true, true);
  });
}
