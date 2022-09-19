import 'package:flutter_test/flutter_test.dart';
import 'package:json_types/json_types.dart';
import 'package:redaux/redaux.dart';
import 'package:redaux_dev_tools_screen/redaux_dev_tools_screen.dart';
import 'package:redaux_dev_tools_screen/src/state-management/add_dispatch_event.dart';
import 'package:redaux_dev_tools_screen/src/state-management/select_action.dart';
import 'package:redaux_dev_tools_screen/src/views/action_history_view/actions_history_item.dart';
import 'package:redaux_widgets_test_utils/redaux_widgets_test_utils.dart';

import '../models/test_async_action.dart';

void main() {
  void setStateForDispatchedAction(WidgetTestHarness harness, Action action) {
    /// The json passed in to [AddDispatchEvent] is recieved by a listener
    /// in the [MainView], which is listening to the [dispatchEvents] stream that
    /// was passed in to the [RedauxDevToolsScreen].

    /// The [dispatchEvents] stream emits json created in [EmitDispatchEvents],
    /// for each action by the app being inspected with the [RedauxDevToolsScreen].
    harness.land(AddDispatchEvent(
        {'state': DevToolsState.initial.toJson(), 'action': action.toJson()}));
  }

  testWidgets('ActionsHistoryItem dispatches SelectAction on tap',
      (tester) async {
    const String actionName = 'Action Name';
    const String actionType = 'ActionType';
    const JsonMap actionState = {'action': {}};
    const index = 0;

    var widgetUnderTest = const ActionsHistoryItem(
      actionName: actionName,
      actionType: actionType,
      actionState: actionState,
      index: index,
    );

    var harness = WidgetTestHarness(
      initialState: DevToolsState.initial,
      child: widgetUnderTest,
    );

    await tester.pumpWidget(harness.widget);

    /// When a [SelectAction] is dispatched by the [widgetUnderTest], we need
    /// the [DevToolsState] to have appropriate data or the [land] function will throw.
    /// We could just add appropriate initial state but I think it is clearer
    /// and a better test to dispatch actions to setup the state.

    /// Setup the [DevToolsState] as if the inspected app dispatched a [TestAsyncAction]
    setStateForDispatchedAction(harness, TestAsyncAction());

    await tester.tap(find.byType(ActionsHistoryItem));

    // check that the expected action was dispatched by the widget
    expect(harness.recordedActions, containsA<SelectAction>(withIndex: index));
  });
}

Matcher containsA<T extends SelectAction>({required int withIndex}) {
  return contains(predicate((a) => a is T && a.index == withIndex));
}
