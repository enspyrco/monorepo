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
    testWidgets('has \'Dismiss\' button', (WidgetTester tester) async {
      final problemPage = ProblemPage(problem);

      await tester.pumpWidget(MaterialApp(home: problemPage));

      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.text('Dismiss'), findsOneWidget);
    });

    testWidgets(
        'is removed from widget tree when ProblemPageData is removed from Store',
        (WidgetTester tester) async {
      final problemPageData = ProblemPageData(problem);
      final state = AppState.init();
      final updatedState =
          state.copyWith(pagesData: state.pagesData.add(problemPageData));
      final store = FakeStore(state: updatedState);
      final appWidget = AppWidgetHarness(store: store).widget;

      await tester.pumpWidget(appWidget);
      await tester.pump();

      expect(find.byType(ProblemPage), findsOneWidget);

      store.updateState(store.state
          .copyWith(pagesData: store.state.pagesData.remove(problemPageData)));
      store.updateState(store.state);

      await tester.pump();

      expect(find.byType(ProblemPage), findsNothing);
    }, skip: true);

    testWidgets('is removed on button tap', (WidgetTester tester) async {
      // We just need the platform service to return a platform so we use a mock.
      final mockPlatformService = MockPlatformService();
      when(mockPlatformService.detectPlatform())
          .thenThrow('Just an error for a ProblemPage');

      final store =
          StoreWithFakedServices(platformService: mockPlatformService);

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
