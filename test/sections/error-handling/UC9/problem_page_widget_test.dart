import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/models/navigation/page_data/problem_page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

import '../../../mocks/redux/fake_store.dart';
import '../../../utils/testing/app_widget_harness.dart';

void main() {
  group('ProblemPage', () {
    final problem = Problem(errorString: 'Problem error message');
    final problemPage = ProblemPage(problem);

    testWidgets('shows expected message', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: problemPage));

      final problemText = find.text(problem.errorString);

      expect(problemText, findsOneWidget);
    });

    testWidgets('is added to widget tree', (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem: problem);

      final store =
          FakeStore(updates: (b) => b..pagesData.add(problemPageData));
      final appWidget = AppWidgetHarness(store: store).widget;

      await tester.pumpWidget(appWidget);

      await tester.pump();

      final finder = find.byType(ProblemPage);

      expect(finder, findsOneWidget);
    });
  });
}
