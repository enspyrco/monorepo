import 'package:our_meals/app/state/app_state.dart';
import 'package:test/test.dart';

void main() {
  test('AppState serializes appropriately', () {
    var state = AppState.initial;
    var json = state.toJson();
    expect(json['reports'], isNull);
  });

  test('AppState equivalence is state based', () {
    var state1 = AppState.initial;
    var state2 = AppState.initial;
    expect(state1 == state2, isTrue);
  });
}
