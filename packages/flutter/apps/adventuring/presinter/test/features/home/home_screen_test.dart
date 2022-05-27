import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presinter/home/account_button.dart';
import 'package:presinter/home/home_screen.dart';
import 'package:presinter/home/role_selector.dart';
import 'package:presinter/home/sessions_view.dart';

void main() {
  testWidgets('HomeScreen should layout expected widgets', (tester) async {
    var harness = const Directionality(
        textDirection: TextDirection.ltr, child: HomeScreen());
    await tester.pumpWidget(harness);

    final roleSelectorFinder = find.byType(RoleSelector);
    final sessionsViewFinder = find.byType(SessionsView);
    final accountButtonFinder = find.byType(AccountButton);

    expect(roleSelectorFinder, findsOneWidget);
    expect(sessionsViewFinder, findsOneWidget);
    expect(accountButtonFinder, findsOneWidget);
  });
}
