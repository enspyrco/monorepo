import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_process/actions/auth/store_auth_step_action.dart';
import 'package:the_process/enums/auth/auth_step.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/widgets/app_widget/initializing_error_page.dart';
import 'package:the_process/widgets/app_widget/initializing_indicator.dart';
import 'package:the_process/widgets/auth/auth_page_buttons/apple_sign_in_button.dart';
import 'package:the_process/widgets/sections/new_section_item.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

import '../../../test-doubles/firebase/fake_firebase_auth.dart';
import '../../../test-doubles/firebase/fake_firebase_firestore.dart';
import '../../../test-utils/store_with_faked_services.dart';
import '../../../test-utils/testing/app_widget_harness.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;
  testWidgets('create a section', (WidgetTester tester) async {
    final fakeAuth = FakeFirebaseAuth();
    final fakeDatabase = FakeFirebaseFirestore();

    final store = StoreWithFakedServices(
        authService: AuthService(auth: fakeAuth),
        databaseService: DatabaseService(database: fakeDatabase));

    final harness = AppWidgetHarness(store: store);

    runApp(harness.widget);

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

      expect(find.byType(WaitingIndicator), findsOneWidget);

      store.dispatch(StoreAuthStepAction(step: AuthStep.waitingForInput));

      await tester.pump();

      expect(find.byType(WaitingIndicator), findsNothing);

      expect(find.byType(AppleSignInButton), findsOneWidget);

      // simulate the state for an authenticated user being emitted
      fakeAuth.emitUser();

      await tester.pump();

      expect(find.byType(NewSectionItem), findsOneWidget);

      final textField = find.byType(TextFormField);
      expect(textField, findsOneWidget);
      await tester.enterText(textField, 'testy');

      expect(find.byType(WaitingIndicator), findsNothing);

      final submitButton = find.byType(MaterialButton);
      expect(submitButton, findsOneWidget);
      await tester.tap(submitButton);

      await tester.pump();

      expect(find.byType(WaitingIndicator), findsOneWidget);
      expect(find.byType(TextFormField), findsNothing);
      expect(find.byType(MaterialButton), findsNothing);

      fakeDatabase.emitSectionsSnapshot();

      await tester.pump();

      expect(find.byType(WaitingIndicator), findsNothing);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(MaterialButton), findsOneWidget);
    });
  });
}
