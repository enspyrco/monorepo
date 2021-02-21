import 'package:test/test.dart';

import 'package:create_section/src/extensions/int_extensions.dart';

void main() {
  group('IntExtension', () {
    test('asValue() returns expected Value', () {
      final exampleInt = 10;

      final value = exampleInt.asValue();

      expect(value.integerValue, exampleInt.toString());
    });
  });
}
