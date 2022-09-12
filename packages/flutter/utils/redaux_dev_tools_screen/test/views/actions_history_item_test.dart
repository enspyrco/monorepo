import 'package:flutter_test/flutter_test.dart';
import 'package:json_types/json_types.dart';
import 'package:redaux_dev_tools_screen/redaux_dev_tools_screen.dart';
import 'package:redaux_dev_tools_screen/src/state-management/add_dispatch_event.dart';
import 'package:redaux_dev_tools_screen/src/state-management/select_action.dart';
import 'package:redaux_dev_tools_screen/src/views/action_history_view/actions_history_item.dart';
import 'package:redaux_widgets_test_utils/redaux_widgets_test_utils.dart';

import '../models/test_async_action.dart';

void main() {
  const String actionName = 'Action Name';
  const String actionType = 'ActionType';
  const JsonMap actionState = {'action': {}};
  const index = 0;
  testWidgets('...', (tester) async {
    var widgetUnderTest = const ActionsHistoryItem(
        actionName: actionName,
        actionType: actionType,
        actionState: actionState,
        index: index);
    var harness = WidgetTestHarness(
        initialState: DevToolsState.initial,
        child: widgetUnderTest,
        endwares: [EmitDispatchEventsEndware()]);

    await tester.pumpWidget(harness.widget);

    // TODO: for the SelectAction action to work we need the state.dispatchEvents to have
    // appropriate data. Maybe we could dispatch an action to setup the state:
    // harness.dispatch(AddDispatchEvent());
    // Or maybe we just add appropriate initial state
    // - I think the former is clearer and a better test

    // The json passed in to AddDispatchEvent(json) is recieved by a listener
    // in the MainView, which is listening to the `dispatchEvents` stream that
    // was passed in to the RedauxDevToolsScreen.

    // The dispatchEvents stream emits json created in EmitDispatchEventsEndware,
    // for each action by the app being inspected with DevTools.

    var action = TestAsyncAction();
    var json = {
      'data': {
        'state': DevToolsState.initial.toJson(),
        'action': action.toJson()
      },
      'type': 'redfire:action_dispatched'
    };

    harness.dispatch(AddDispatchEvent(json['data'] as Map<String, dynamic>));

    await tester.tap(find.byType(ActionsHistoryItem));

    expect(harness.dispatchedEvents, contains(SelectAction(index)));
  });
}
