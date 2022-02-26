import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/problems/widgets/problem_page_view.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('ProblemPage', () {
    final problem = ProblemInfo('Problem error message');

    testWidgets('is added to widget tree', (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem);

      final state = ExampleAppState.init();
      final updatedState = state.copyWith(
        pages: state.pages.add(problemPageData),
        auth: AuthStateExample.authenticated,
      );

      final appWidget =
          AppWidgetHarness.withFakeStore(initialState: updatedState).widget;

      await tester.pumpWidget(appWidget);
      await tester.pump();

      final finder = find.byType(ProblemPageView);

      expect(finder, findsOneWidget);
    });
  });
}
