import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:the_process/middleware/app_middleware.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/problem_page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/reducers/app_reducer.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

import '../../../mocks/firebase/firebase_auth_fake.dart';
import '../../../mocks/firebase/firebase_firestore_fake.dart';
import '../../../mocks/redux/fake_store.dart';
import '../../../mocks/services/platform_service_mock.dart';
import '../../../utils/testing/app_widget_harness.dart';

void main() {
  group('ProblemPage', () {
    final problem =
        Problem(errorString: 'Problem error message', traceString: null);
    testWidgets('has \'Dismiss\' button', (WidgetTester tester) async {
      final problemPage = ProblemPage(problem);

      await tester.pumpWidget(MaterialApp(home: problemPage));

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text('Dismiss'), findsOneWidget);
    });

    testWidgets(
        'is removed from widget tree when ProblemPageData is removed from Store',
        (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem: problem);
      final store =
          FakeStore(updates: (b) => b..pagesData.add(problemPageData));
      final appWidget = AppWidgetHarness(store: store).widget;

      await tester.pumpWidget(appWidget);
      await tester.pump();

      expect(find.byType(ProblemPage), findsOneWidget);

      store.updateState((b) => b..pagesData.remove(problemPageData));

      await tester.pump();

      expect(find.byType(ProblemPage), findsNothing);
    }, skip: true);

    testWidgets('is removed on button tap', (WidgetTester tester) async {
      // Create auth & database objects we can later use to emit various events
      final fakeAuth = FirebaseAuthFake();
      final fakeDatabase = FirebaseFirestoreFake();

      // Create the services using the previous objects
      final authService = AuthService(auth: fakeAuth);
      final databaseService = DatabaseService(database: fakeDatabase);

      // We just need the platform service to return a platform so we use a mock.
      final mockPlatformService = PlatformServiceMock();
      when(mockPlatformService.detectPlatform())
          .thenThrow('Just an error for a ProblemPage');

      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: [
          ...createAppMiddleware(
            authService: authService,
            databaseService: databaseService,
            platformService: mockPlatformService,
          ),
        ],
      );
      final harness = AppWidgetHarness(store: store);

      runApp(harness.widget);

      await tester.pump();

      expect(find.byType(ProblemPage), findsOneWidget);

      // Tap the dismiss button.
      await tester.tap(find.byType(OutlinedButton));

      await tester.pump();

      expect(find.byType(ProblemPage), findsNothing);
    }, skip: true);
  });
}
