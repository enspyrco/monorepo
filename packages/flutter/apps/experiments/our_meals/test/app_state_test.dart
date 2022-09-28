import 'package:our_meals/app/state/app_state.dart';
import 'package:test/test.dart';

void main() {
  test('AppState serializes appropriately', () {
    var state = AppState.initial;
    var json = state.toJson();
    expect(json['errorMessages'], equals([]));
  });
}
