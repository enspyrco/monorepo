import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:the_process/middleware/app_middleware.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/reducers/app_reducer.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';
import 'package:the_process/services/http_service.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

import '../../../test-doubles/services/service_test_doubles.mocks.dart';
import '../../../test-doubles/firebase/firebase_auth_fake.dart';
import '../../../test-doubles/firebase/firebase_firestore_fake.dart';
import '../../../test-doubles/http/fake_client.dart';
import '../../../test-utils/testing/app_widget_harness.dart';

void main() {
  group('ProblemPage integration test', () {
    setUpAll(() async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
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
      final mockPlatformService = MockPlatformService();
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

      await widget.pumpAndSettle();

      expect(find.byType(ProblemPage), findsOneWidget);
    });
  });
}
