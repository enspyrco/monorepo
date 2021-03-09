import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/app_init/plumb_streams_action.dart';
import 'package:the_process/actions/auth/observe_auth_state_action.dart';
import 'package:the_process/actions/platform/detect_platform_action.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/widgets/app_widget/initializing_error_page.dart';
import 'package:the_process/widgets/app_widget/initializing_indicator.dart';
import 'package:the_process/widgets/sections/new_section_item.dart';

import '../../data/models/auth_user_data_examples.dart';
import '../../mocks/redux/fake_store.dart';
import '../../utils/testing/app_widget_harness.dart';
import '../../utils/testing/completable_app_widget_harness.dart';
import '../../utils/testing/completable_app_widget_harness_with_fake_store.dart';

void main() {
  group('AppWidget', () {
    testWidgets('shows NewSectionItem after authentication',
        (WidgetTester tester) async {
      /// Build a test harness that updates the app state so the [InitialPage]
      /// builds the [HomePage].
      final state = AppState.init();
      final updatedState = state.copyWith(
          authUserData: AuthUserDataExamples.minimal,
          authStep: AuthStep.waitingForInput);
      final fakeAuthenticatedStore = FakeStore(state: updatedState);
      final harness = AppWidgetHarness(store: fakeAuthenticatedStore);

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      await tester.pump();

      expect(find.byType(InitializingIndicator), findsNothing);

      expect(find.byType(InitializingErrorPage), findsNothing);

      expect(find.byType(NewSectionItem), findsOneWidget);
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
