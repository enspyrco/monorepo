import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

import '../../../test-doubles/services/service_test_doubles.mocks.dart';
import '../../../test-doubles/redux/fake_store.dart';
import '../../../test-utils/store_with_faked_services.dart';
import '../../../test-utils/testing/app_widget_harness.dart';

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
      final updatedState =
          state.copyWith(pagesData: state.pagesData.add(problemPageData));

      final appWidget =
          AppWidgetHarness(store: FakeStore(state: updatedState)).widget;

      await tester.pumpWidget(appWidget);

      await tester.pump();

      final finder = find.byType(ProblemPage);

      expect(finder, findsOneWidget);
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

      await widget.pump();

      expect(find.byType(ProblemPage), findsOneWidget);
    });
  });
}
