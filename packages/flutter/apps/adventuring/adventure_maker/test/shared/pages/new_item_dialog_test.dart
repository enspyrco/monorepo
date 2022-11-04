import 'package:adventure_maker/_app/state/app_state.dart';
import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/missions/set_adventure_node_selection.dart';
import 'package:adventure_maker/shared/pages/new_item_dialog.dart';
import 'package:adventure_maker/shared/widgets/adventure_nodes_drop_down.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Type typeOf<T>() => T;

void main() {
  group('NewItemDialogContent', () {
    testWidgets('shows expected UI when advnture nodes are selected',
        (tester) async {
      // Test data.
      const adventure = AdventureModel(name: 'adventure name');
      const challenge = ChallengeModel(name: 'challenge name');

      // Test harness.
      var harness = WidgetTestHarness<AppState>(
          initialState: AppState.initial,
          child: NewItemDialogContent(TextEditingController()));

      await tester.pumpWidget(harness.widget);

      expect(find.byType(typeOf<AdventureNodesDropDown<AdventureModel>>()),
          findsNothing);
      expect(find.byType(typeOf<AdventureNodesDropDown<ChallengeModel>>()),
          findsNothing);

      harness.land(const SetAdventureNodeSelection(adventure));

      await tester.pumpAndSettle();

      expect(find.byType(typeOf<AdventureNodesDropDown<AdventureModel>>()),
          findsOneWidget);
      expect(find.byType(typeOf<AdventureNodesDropDown<ChallengeModel>>()),
          findsNothing);

      harness.land(const SetAdventureNodeSelection(challenge));

      await tester.pumpAndSettle();

      expect(find.byType(typeOf<AdventureNodesDropDown<AdventureModel>>()),
          findsOneWidget);
      expect(find.byType(typeOf<AdventureNodesDropDown<ChallengeModel>>()),
          findsOneWidget);
    });
  });
}
