import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  test('Pointless test so coverage gets generated', () {
    final harness = WidgetTestHarness.withFakeStore(
        initialState: ExampleAppState.init(), widgetUnderTest: Container());

    expect(harness.receivedActions, isEmpty);
  });
}
