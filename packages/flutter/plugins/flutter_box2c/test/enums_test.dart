import 'package:flutter_box2c/src/b2_enums.dart';
import 'package:flutter_test/flutter_test.dart';

import 'generated_bindings.dart';

void main() {
  test('BodyType enum matches b2BodyType class enum', () {
    expect(BodyType.values.length, equals(b2BodyType.b2_bodyTypeCount));
    expect(BodyType.staticBody.index, equals(b2BodyType.b2_staticBody));
    expect(BodyType.dynamicBody.index, equals(b2BodyType.b2_dynamicBody));
    expect(BodyType.kinematicBody.index, equals(b2BodyType.b2_kinematicBody));
  });
}
