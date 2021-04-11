import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/app_init/plumb_streams_action.dart';
import 'package:the_process/actions/auth/observe_auth_state_action.dart';
import 'package:the_process/actions/platform/detect_platform_action.dart';
import 'package:the_process/widgets/app_widget/initializing_error_page.dart';
import 'package:the_process/widgets/app_widget/initializing_indicator.dart';
import 'package:the_process/widgets/home/home_page.dart';
import 'package:the_process/widgets/home/project-overview/project_overview.dart';
import 'package:the_process/widgets/home/section-detail/section_detail_page.dart';

import '../../test-doubles/redux/fake_store.dart';
import '../../test-utils/testing/app_widget_harness.dart';
import '../../test-utils/testing/completable_app_widget_harness.dart';
import '../../test-utils/testing/completable_app_widget_harness_with_fake_store.dart';

void main() {
  group('AppWidget', () {
    testWidgets('shows HomePage after authentication',
        (WidgetTester tester) async {
      /// Build a test harness that updates the app state so the [InitialPage]
      /// builds the [HomePage].
      final harness = AppWidgetHarness(store: FakeStore.authenticated());

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      // check we got past app initialization
      expect(find.byType(InitializingIndicator), findsNothing);
      expect(find.byType(InitializingErrorPage), findsNothing);

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('shows item/detail view on large screens',
        (WidgetTester tester) async {
      /// Build a test harness that updates the app state so the [InitialPage]
      /// builds the [HomePage].
      final harness = AppWidgetHarness(store: FakeStore.authenticated());

      // Set the screen size to large and ensure reset after the test ends
      // This is actually the default size but added for clarity
      tester.binding.window.physicalSizeTestValue = Size(800, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      // check we got past app initialization
      expect(find.byType(InitializingIndicator), findsNothing);
      expect(find.byType(InitializingErrorPage), findsNothing);

      expect(find.byType(ProjectOverview), findsOneWidget);
      expect(find.byType(SectionDetailPage), findsOneWidget);
    });

    testWidgets('shows ProjectOverview only on small screens',
        (WidgetTester tester) async {
      /// Build a test harness that updates the app state so the [InitialPage]
      /// builds the [HomePage].
      final harness = AppWidgetHarness(store: FakeStore.authenticated());

      // Set the screen size and ensure reset after the test ends
      tester.binding.window.physicalSizeTestValue = Size(600, 600);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      // check we got past app initialization
      expect(find.byType(InitializingIndicator), findsNothing);
      expect(find.byType(InitializingErrorPage), findsNothing);

      expect(find.byType(ProjectOverview), findsOneWidget);
      expect(find.byType(SectionDetailPage), findsOneWidget);
    });

    testWidgets('shows expected UI while initializing',
        (WidgetTester tester) async {
      final harness = CompletableAppWidgetHarness();

      // Tell the tester to build the widget tree.
      await tester.pumpWidget(harness.widget);

      final initializingIndicatorFinder = find.byType(InitializingIndicator);

      expect(initializingIndicatorFinder, findsOneWidget);

      // Verify the expected text is shown, indicating waiting for Firebase init
      expect(find.text('Firing up the machine...'), findsOneWidget);

      harness.completeFirebase();

      await tester.pump();

      // Verify the expected text is shown, indicating waiting for redux init
      expect(find.text('Plumbing the streams...'), findsOneWidget);

      harness.completeRedux();

      await tester.pump();

      expect(initializingIndicatorFinder, findsNothing);
    });

    testWidgets('dispatches actions after initialization',
        (WidgetTester tester) async {
      final harness = CompletableAppWidgetHarnessWithFakeStore();

      // Tell the tester to build the widget tree.
      await tester.pumpWidget(harness.widget);

      final initializingIndicatorFinder = find.byType(InitializingIndicator);

      expect(initializingIndicatorFinder, findsOneWidget);

      // Verify the expected text is shown, indicating waiting for Firebase init.
      expect(find.text('Firing up the machine...'), findsOneWidget);

      harness.completeFirebase();

      await tester.pump();

      // Verify the expected text is shown, indicating waiting for Redux init.
      expect(find.text('Plumbing the streams...'), findsOneWidget);

      harness.completeRedux();

      await tester.pump();

      // Check we have moved past the waiting states.
      expect(initializingIndicatorFinder, findsNothing);

      // Check that all the expected actions were dispatched.
      expect(harness.receivedActions, contains(ObserveAuthStateAction()));
      expect(harness.receivedActions, contains(DetectPlatformAction()));
      expect(harness.receivedActions, contains(PlumbStreamsAction()));
    });
  });
}
