import 'package:flutter_test/flutter_test.dart';
import 'package:json_types/json_types.dart';
import 'package:redaux_dev_tools_screen/src/views/action_history_view/actions_history_item.dart';

void main() {
  const String actionName = 'Action Name';
  const String actionType = 'ActionType';
  const JsonMap actionState = {'action': {}};
  const index = 1;
  testWidgets('...', (tester) async {
    var widgetUnderTest = const ActionsHistoryItem(
        actionName: actionName,
        actionType: actionType,
        actionState: actionState,
        index: index);
    await tester.pumpWidget(widgetUnderTest);
  });
}
