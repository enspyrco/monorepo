import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:redfire_test/redfire_test.dart';

import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/pages/new_item_dialog.dart';
import 'package:adventure_maker/shared/widgets/adventure_nodes_drop_down.dart';

void main() {
  group('NewItemDialogContent', () {
    testWidgets('shows expected UI when advnture nodes are selected',
        (tester) async {
      // Test data.
      var adventure = const AdventureModel(name: 'adventure name');
      var challenge = const ChallengeModel(name: 'challenge name');

      // Test harness.
      var initialState = AppState.init();
      var store = FakeStore(initialState);
      var harness = WidgetTestHarness.withStore(
          initializedStore: store,
          widgetUnderTest: NewItemDialogContent(TextEditingController()));

      await tester.pumpWidget(harness.widget);

      expect(find.byType(typeOf<AdventureNodesDropDown<AdventureModel>>()),
          findsNothing);
      expect(find.byType(typeOf<AdventureNodesDropDown<ChallengeModel>>()),
          findsNothing);

      store.updateState(store.state.copyWith.adventures(selected: adventure));

      await tester.pumpAndSettle();

      expect(find.byType(typeOf<AdventureNodesDropDown<AdventureModel>>()),
          findsOneWidget);
      expect(find.byType(typeOf<AdventureNodesDropDown<ChallengeModel>>()),
          findsNothing);

      store.updateState(store.state.copyWith.challenges(selected: challenge));

      await tester.pumpAndSettle();

      expect(find.byType(typeOf<AdventureNodesDropDown<AdventureModel>>()),
          findsOneWidget);
      expect(find.byType(typeOf<AdventureNodesDropDown<ChallengeModel>>()),
          findsOneWidget);
    });
  });
}
