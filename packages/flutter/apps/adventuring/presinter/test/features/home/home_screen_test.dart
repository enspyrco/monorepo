import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presinter/home/home_screen.dart';
import 'package:presinter/home/role_selector.dart';
import 'package:presinter/home/sessions_view.dart';
import 'package:redfire/widgets.dart';

void main() {
  testWidgets('HomeScreen should layout expected widgets', (tester) async {
    var harness = const Directionality(
        textDirection: TextDirection.ltr, child: HomeScreen());
    await tester.pumpWidget(harness);

    final roleSelectorFinder = find.byType(RoleSelector);
    final sessionsViewFinder = find.byType(SessionsView);
    final accountButtonFinder = find.byType(AvatarMenuButton);

    expect(roleSelectorFinder, findsOneWidget);
    expect(sessionsViewFinder, findsOneWidget);
    expect(accountButtonFinder, findsOneWidget);
  });
}
