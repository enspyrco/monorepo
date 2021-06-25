import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/auth/store_auth_step_action.dart';
import 'package:the_process/enums/auth/auth_step_enum.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/widgets/app_widget/initializing_error_page.dart';
import 'package:the_process/widgets/app_widget/initializing_indicator.dart';
import 'package:the_process/widgets/auth/auth_page_buttons/apple_sign_in_button.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/new_section_item.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

import '../../test-doubles/firebase/fake_firebase_auth.dart';
import '../../test-doubles/firebase/fake_firebase_firestore.dart';
import '../../test-utils/store_with_faked_services.dart';
import '../../test-utils/testing/app_widget_harness.dart';

void main() {
  testWidgets(
      'AppWidget (with real services) shows NewSectionItem after authentication',
      (WidgetTester tester) async {
    final fakeAuth = FakeFirebaseAuth();
    final fakeDatabase = FakeFirebaseFirestore();

    final store = StoreWithFakedServices(
        authService: AuthService(auth: fakeAuth),
        databaseService: DatabaseService(database: fakeDatabase));

    final harness = AppWidgetHarness(store: store);

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    await tester.pump();

    // test we have gotten past initialization and are in the 'checking' state
    expect(find.byType(InitializingIndicator), findsNothing);
    expect(find.byType(InitializingErrorPage), findsNothing);
    expect(find.byType(WaitingIndicator), findsOneWidget);

    store.dispatch(StoreAuthStepAction(step: AuthStepEnum.waitingForInput));

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

    final submitButton = find.byType(FloatingActionButton);
    expect(submitButton, findsOneWidget);
    await tester.tap(submitButton);

    await tester.pump();

    expect(find.byType(WaitingIndicator), findsOneWidget);
    expect(find.byType(TextFormField), findsNothing);
    expect(find.byType(FloatingActionButton), findsNothing);

    fakeDatabase.emitSectionsSnapshot();

    await tester.pump();

    expect(find.byType(WaitingIndicator), findsNothing);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  }, skip: true);
}
