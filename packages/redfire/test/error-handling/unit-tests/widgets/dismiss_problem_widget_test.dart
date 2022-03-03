import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redfire/src/problems/pages/problem_page.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('ProblemPage', () {
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
