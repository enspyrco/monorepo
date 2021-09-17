import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/navigation/models/problem_page_data.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/widgets/problem_page.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('ProblemPage', () {
    final problem = ProblemInfo('Problem error message');
    final problemPage = ProblemPage(problem);

    testWidgets('shows expected message', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: problemPage));

      final problemText = find.text(problem.message);

      expect(problemText, findsOneWidget);
    });

    testWidgets('is added to widget tree', (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem);

      final state = ExampleAppState.init();
      final updatedState =
          state.copyWith(pages: state.pages.add(problemPageData));

      final appWidget =
          AppWidgetHarness.withFakeStore(initialState: updatedState).widget;

      await tester.pumpWidget(appWidget);
      await tester.pump();

      final finder = find.byType(ProblemPage);

      expect(finder, findsOneWidget);
    });

    testWidgets('problem page appears after error caught',
        (WidgetTester tester) async {
      // The default services harness has mocked out plugins.
      // One of the initial actions attempts to listen to auth state changes
      // which throws in this context as the MockFirebaseAuth has no stub set.
      final harness = AppWidgetHarness.withMockedPlugins(
          ExampleAppState.init(), ServicesHarness());

      await tester.pumpWidget(harness.widget);
      await tester.pump();

      expect(find.byType(ProblemPage), findsOneWidget);
    });
  });
}
