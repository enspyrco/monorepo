import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:the_process/middleware/app_middleware.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/reducers/app_reducer.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/http_service.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

import '../../../mocks/firebase/firebase_auth_fake.dart';
import '../../../mocks/firebase/firebase_firestore_fake.dart';
import '../../../mocks/http/fake_client.dart';
import '../../../mocks/redux/fake_store.dart';
import '../../../mocks/services/platform_service_mock.dart';
import '../../../utils/testing/app_widget_harness.dart';

void main() {
  group('ProblemPage', () {
    final problem =
        Problem(errorString: 'Problem error message', traceString: null);
    final problemPage = ProblemPage(problem);

    testWidgets('shows expected message', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: problemPage));

      final problemText = find.text(problem.errorString);

      expect(problemText, findsOneWidget);
    });

    testWidgets('is added to widget tree', (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem);

      final state = AppState.init();
      final updatedState = state.copyWith(
          pagesData: state.pagesData.copyAndAdd(problemPageData));
      final store = FakeStore(state: updatedState);
      final appWidget = AppWidgetHarness(store: store).widget;

      await tester.pumpWidget(appWidget);

      await tester.pump();

      final finder = find.byType(ProblemPage);

      expect(finder, findsOneWidget);
    });

    testWidgets('problem page appears after error caught',
        (WidgetTester widget) async {
      // Create auth & database objects we can later use to emit various events
      final fakeAuth = FirebaseAuthFake();
      final fakeDatabase = FirebaseFirestoreFake();
      final fakeClient = FakeHttpClient();

      // Create the services using the previous objects
      final authService = AuthService(auth: fakeAuth);
      final databaseService = DatabaseService(database: fakeDatabase);
      final httpService = HttpService(client: fakeClient);

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
              httpService: httpService),
        ],
      );
      final harness = AppWidgetHarness(store: store);

      runApp(harness.widget);

      await widget.pump();

      expect(find.byType(ProblemPage), findsOneWidget);
    });
  });
}
