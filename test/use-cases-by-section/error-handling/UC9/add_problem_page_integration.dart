import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

import '../../../test-doubles/services/service_test_doubles.mocks.dart';
import '../../../test-utils/store_with_faked_services.dart';
import '../../../test-utils/testing/app_widget_harness.dart';

void main() {
  group('ProblemPage integration test', () {
    setUpAll(() async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets('problem page appears after error caught',
        (WidgetTester widget) async {
      // We just need the platform service to return a platform so we use a mock.
      final mockPlatformService = MockPlatformService();
      when(mockPlatformService.detectPlatform())
          .thenThrow('Just an error for a ProblemPage');

      final store =
          StoreWithFakedServices(platformService: mockPlatformService);

      final harness = AppWidgetHarness(store: store);

      runApp(harness.widget);

      await widget.pumpAndSettle();

      expect(find.byType(ProblemPage), findsOneWidget);
    });
  });
}
