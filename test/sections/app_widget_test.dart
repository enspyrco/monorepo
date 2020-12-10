import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/widgets/app_widget/initializing_error_page.dart';
import 'package:the_process/widgets/app_widget/initializing_indicator.dart';
import 'package:the_process/widgets/sections/new_section_item.dart';

import '../data/models/auth_user_data_example.dart';
import '../mocks/redux/fake_store.dart';
import '../utils/testing/app_widget_harness.dart';

void main() {
  testWidgets('AppWidget shows NewSectionItem after authentication',
      (WidgetTester tester) async {
    // Declare the Finders used in the test.

    /// Build a test harness that updates the app state so the [InitialPage]
    /// builds the [HomePage].
    final fakeAuthenticatedStore = FakeStore(
        updates: (b) => b
          ..authUserData.replace(AuthUserDataExample.minimal)
          ..authStep = AuthStep.waitingForInput);
    final harness = AppWidgetHarness(store: fakeAuthenticatedStore);

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    await tester.pump();

    expect(find.byType(InitializingIndicator), findsNothing);

    expect(find.byType(InitializingErrorPage), findsNothing);

    expect(find.byType(NewSectionItem), findsOneWidget);
  });
}
