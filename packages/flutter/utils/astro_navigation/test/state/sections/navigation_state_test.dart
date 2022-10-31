import 'dart:convert';

import 'package:astro_navigation/src/state/sections/navigation_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('NavigationState json encodes', () {
    expect(jsonEncode(const NavigationState(stack: [])), isA<String>());
  });
}
