import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/actions/sections/update_new_section_v_m.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/widgets/app_widget/initializing_error_page.dart';
import 'package:the_process/widgets/app_widget/initializing_indicator.dart';
import 'package:the_process/widgets/sections/new_section_item.dart';

import '../../../data/models/auth_user_data_example.dart';
import '../../../mocks/redux/fake_store.dart';
import '../../../utils/testing/app_widget_harness.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  testWidgets('create a section', (WidgetTester tester) async {
    // When we can use the FirebaseAuth emulator we can create a real store with
    // real services which should make things easier.

    // final store = Store<AppState>(
    //   appReducer,
    //   middleware: createAppMiddleware(
    //       authService: AuthService(
    //           FirebaseAuth.instance, StreamController<ReduxAction>())),
    //   initialState: AppState.init(),
    // );
    // final harness = AppWidgetHarness(store: store);

    // For now we setup the app state so the app builds the home page and skips
    // the auth page.

    // Create a test harness that has a fake store with app state that bipasses
    // authentication and goes straight to the home page, and tell the tester
    // to build the widget tree.
    final fakeStore = FakeStore(
        updates: (b) => b
          ..authUserData.replace(AuthUserDataExample.minimal)
          ..authStep = AuthStep.waitingForInput);
    final harness = AppWidgetHarness(store: fakeStore);

    await runApp(harness.widget);

    // Trace the timeline of the following operation. The timeline result will
    // be written to `build/integration_response_data.json` with the key
    // `timeline`.
    await binding.traceAction(() async {
      await tester.pump();

      final initializingIndicatorFinder = find.byType(InitializingIndicator);

      expect(initializingIndicatorFinder, findsOneWidget);

      await tester.pump();

      expect(initializingIndicatorFinder, findsNothing);

      expect(find.byType(InitializingErrorPage), findsNothing);

      // expect(find.byType(GoogleSignInButton), findsOneWidget);

      expect(find.byType(NewSectionItem), findsOneWidget);

      final textField = find.byType(TextFormField);
      expect(textField, findsOneWidget);
      await tester.enterText(textField, 'testy');

      expect(fakeStore.dispatchedActions,
          contains(UpdateNewSectionVM(name: 'testy')));

      final submitButton = find.byType(MaterialButton);
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);

      expect(fakeStore.dispatchedActions, contains(CreateSection()));
    });
  });
}
