import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/sections/section.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/new_section_item.dart';
import 'package:the_process/widgets/home/project-overview/sections-view/sections_view.dart';
import 'package:the_process/widgets/shared/waiting_indicator.dart';

import '../../../test-doubles/redux/fake_store.dart';
import '../../../test-utils/widget_test_harness.dart';

void main() {
  testWidgets('SectionsPage updates on creatingNewSection change',
      (WidgetTester tester) async {
    // Setup the harness and check it is in the initial state.
    final state = AppState.init();
    final harness = WidgetTestHarness(
        widgetUnderTest: SectionsView(), fakeStore: FakeStore(state: state));
    expect(harness.state.sections.creatingNewSection, false);
    expect(harness.state.sections.list, BuiltList<Section>());

    // Build the widget tree.
    await tester.pumpWidget(harness.widget);

    final newSectionItem = find.byType(NewSectionItem);
    final waitingIndicator = find.byType(WaitingIndicator);

    expect(newSectionItem, findsOneWidget);
    expect(waitingIndicator, findsNothing);

    harness.updateAppState(state.copyWith.sections(creatingNewSection: true));

    await tester.pump();

    expect(newSectionItem, findsNothing);
    expect(waitingIndicator, findsOneWidget);
  });
}
