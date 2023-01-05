import 'package:flutter_test/flutter_test.dart';
import 'package:our_meals/app/state/app_state.dart';

void main() {
  test('AppState serializes appropriately', () {
    var state = AppState.initialValue();
    var json = state.toJson();
    expect(json['reports'], isNull);
  });

  test('AppState equivalence is state based', () {
    var state1 = AppState.initialValue();
    var state2 = AppState.initialValue();
    expect(state1 == state2, isTrue);
  });
}
