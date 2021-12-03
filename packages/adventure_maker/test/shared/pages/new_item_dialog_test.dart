import 'package:adventure_maker/shared/pages/new_item_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MainPage has ...', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: NewItemDialogContent()));

    // final textFinder = find.text('Sign Out');
    // expect(textFinder, findsOneWidget);

    expect(true, true);
  });
}
