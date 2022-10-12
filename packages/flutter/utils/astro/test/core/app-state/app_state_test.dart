import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:test/test.dart';

import '../../test-doubles/example_app_state.dart';
import '../../test-doubles/identity_equivalence_app_state.dart';

void main() {
  test('AppState objects with the same state are equal', () {
    var a = ExampleAppState(reports: [ErrorReport(message: 'message')]);
    var b = ExampleAppState(reports: [ErrorReport(message: 'message')]);

    expect(a == b, true);
  });

  test('AppState can be cloned with empty copyWith()', () {
    // When app state uses identity equivalence, cloned objects are not equal
    var c =
        IdentityEquivalenceAppState(reports: [ErrorReport(message: 'message')]);
    var d = c.copyWith();

    expect(c == d, false);

    // When app state uses state-based equivalence, cloned objects are equal
    var a = ExampleAppState(reports: [ErrorReport(message: 'message')]);
    var b = a.copyWith();

    expect(a == b, true);
  });
}
