import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/pages/new_item_dialog.dart';
import 'package:adventure_maker/shared/widgets/adventure_nodes_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('NewItemDialogContent', () {
    testWidgets('only shows textfield when nothing selected',
        (WidgetTester tester) async {
      final harness = WidgetTestHarness.withFakeStore(
        initialState: AppState.init(),
        widgetUnderTest: NewItemDialogContent(TextEditingController()),
      );

      await tester.pumpWidget(harness.widget);

      expect(find.byType(AdventureNodesDropDown), findsNothing);
    });

    testWidgets('shows adventures dropdown when adventure selected',
        (WidgetTester tester) async {
      // Setup the state
      var adventure = const AdventureModel(name: 'testName');
      var testState = AppState.init().copyWith.adventures(selected: adventure);

      var harness = WidgetTestHarness.withFakeStore(
        initialState: testState,
        widgetUnderTest: NewItemDialogContent(TextEditingController()),
      );

      await tester.pumpWidget(harness.widget);

      expect(find.byType(typeOf<AdventureNodesDropDown<AdventureModel>>()),
          findsOneWidget);
    });
  });
}
