import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/src/navigation/models/page_data.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/widgets/problem_info_page.dart';
import 'package:redfire_test/redfire_test.dart';

import '../../test-data/app_state/app_state.dart';

void main() {
  group('ProblemInfoPage', () {
    final problem = ProblemInfo('Problem error message');
    testWidgets('has \'Dismiss\' button', (WidgetTester tester) async {
      final problemPage = ProblemInfoPage(problem);

      await tester.pumpWidget(MaterialApp(home: problemPage));

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text('Dismiss'), findsOneWidget);
    });

    testWidgets(
        'is removed from widget tree when ProblemPageData is removed from Store',
        (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem);
      final state = AppState.init();
      final updatedState =
          state.copyWith(pages: state.pages.add(problemPageData));
      final store = FakeStore(updatedState);
      final appWidget =
          AppWidgetHarness.withStore(intializedStore: store).widget;

      await tester.pumpWidget(appWidget);
      await tester.pump();

      expect(find.byType(ProblemInfoPage), findsOneWidget);

      store.updateState(store.state
          .copyWith(pages: store.state.pages.remove(problemPageData)));
      store.updateState(store.state);

      await tester.pumpAndSettle();

      expect(find.byType(ProblemInfoPage), findsNothing);
    });

    testWidgets('is removed on button tap', (WidgetTester tester) async {
      // Setup the services with mock plugins, leaving one function, ie.
      // FirebaseAuth.onStateChanges, not stubbed so an exception is thrown
      // and a ProblemInfoPage added to the pages.
      final services = ServicesHarness();
      when(services.mockPlatformWrapper.isMacOS).thenReturn(true);

      final harness =
          AppWidgetHarness.withMockedPlugins(AppState.init(), services);

      // Build the widget tree and let the page transition settle.
      await tester.pumpWidget(harness.widget);
      await tester.pumpAndSettle();

      expect(find.byType(ProblemInfoPage), findsOneWidget);

      // Tap the dismiss button and let the page transition settle.
      await tester.tap(find.byType(OutlinedButton));
      await tester.pumpAndSettle();

      expect(find.byType(ProblemInfoPage), findsNothing);
    });
  });
}
