import 'package:test/test.dart';

import 'package:create_section/src/extensions/string_extensions.dart';

void main() {
  group('StringExtension', () {
    test('asValue() returns expected Value', () {
      final exampleString = 'asdf';

      final value = exampleString.asValue();

      expect(value.stringValue, exampleString);
    });
  });
}
