import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/widgets/problem_info_view.dart';

void main() {
  group('ProblemInfoView', () {
    testWidgets('has \'Dismiss\' button', (WidgetTester tester) async {
      final view = ProblemInfoView(ProblemInfo('Problem error message'));

      await tester.pumpWidget(MaterialApp(home: view));

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text('Dismiss'), findsOneWidget);
    });

    testWidgets('shows expected message', (WidgetTester tester) async {
      const testMessage = 'Problem error message';

      final view = ProblemInfoView(ProblemInfo(testMessage));

      await tester.pumpWidget(MaterialApp(home: view));

      final problemText = find.text(testMessage);

      expect(problemText, findsOneWidget);
    });
  });
}
