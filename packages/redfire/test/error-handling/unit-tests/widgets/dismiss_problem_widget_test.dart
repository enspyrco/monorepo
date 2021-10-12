import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/src/navigation/models/problem_page_data.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/pages/problem_page.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('ProblemPage', () {
    final problem = ProblemInfo('Problem error message');

    testWidgets(
        'is removed from widget tree when ProblemPageData is removed from Store',
        (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem);
      final state = ExampleAppState.init();
      final updatedState =
          state.copyWith(pages: state.pages.add(problemPageData));
      final store = FakeStore(updatedState);
      final appWidget =
          AppWidgetHarness.withStore(initializedStore: store).widget;

      await tester.pumpWidget(appWidget);
      await tester.pump();

      expect(find.byType(ProblemPage), findsOneWidget);

      store.updateState(store.state
          .copyWith(pages: store.state.pages.remove(problemPageData)));
      store.updateState(store.state);

      await tester.pumpAndSettle();

      expect(find.byType(ProblemPage), findsNothing);
    });

    testWidgets(
      'is removed on button tap',
      (WidgetTester tester) async {
        // Setup the services with mock plugins, leaving one function, ie.
        // FirebaseAuth.onStateChanges, not stubbed so an exception is thrown
        // and a ProblemPage added to the pages.
        final services = ServicesHarness();
        when(services.mockPlatformWrapper.isMacOS).thenReturn(true);

        final harness = AppWidgetHarness.withMockedPlugins(
            ExampleAppState.init(), services);

        // Build the widget tree and let the page transition settle.
        await tester.pumpWidget(harness.widget);
        await tester.pumpAndSettle();

        expect(find.byType(ProblemPage), findsOneWidget);

        // Tap the dismiss button and let the page transition settle.
        await tester.tap(find.byType(OutlinedButton));
        await tester.pumpAndSettle();

        expect(find.byType(ProblemPage), findsNothing);
      },
      skip: true, // TODO: determine why authStateChanges() is not stubbed
    );
  });
}
