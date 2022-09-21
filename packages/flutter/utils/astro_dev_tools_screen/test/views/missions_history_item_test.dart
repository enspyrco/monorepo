import 'package:astro/astro.dart';
import 'package:astro_dev_tools_screen/astro_dev_tools_screen.dart';
import 'package:astro_dev_tools_screen/src/state-management/add_mission_event.dart';
import 'package:astro_dev_tools_screen/src/state-management/select_mission.dart';
import 'package:astro_dev_tools_screen/src/views/missions_history_view/missions_history_item.dart';
import 'package:astro_widgets_test_utils/astro_widgets_test_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_types/json_types.dart';

import '../models/test_away_mission.dart';

void main() {
  void setStateForMission(WidgetTestHarness harness, Mission mission) {
    /// The json passed in to [AddDispatchEvent] is recieved by a listener
    /// in the [MainView], which is listening to the [missionEvents] stream that
    /// was passed in to the [AstroDevToolsScreen].

    /// The [missionEvents] stream emits json created in [EmitDispatchEvents],
    /// for each mission by the app being inspected with the [AstroDevToolsScreen].
    harness.land(AddMissionEvent({
      'state': DevToolsState.initial.toJson(),
      'mission': mission.toJson()
    }));
  }

  testWidgets('MissionsHistoryItem starts SelectMission on tap',
      (tester) async {
    const String missionName = 'Mission Name';
    const String missionType = 'MissionType';
    const JsonMap missionState = {'mission': {}};
    const index = 0;

    var widgetUnderTest = const MissionsHistoryItem(
      missionName: missionName,
      missionType: missionType,
      missionState: missionState,
      index: index,
    );

    var harness = WidgetTestHarness(
      initialState: DevToolsState.initial,
      child: widgetUnderTest,
    );

    await tester.pumpWidget(harness.widget);

    /// When [SelectMission] is landed by the [widgetUnderTest], we need
    /// the [DevToolsState] to have appropriate data or the [land] function will throw.
    /// We could just add appropriate initial state but I think it is clearer
    /// and a better test to start missions to setup the state.

    /// Setup the [DevToolsState] as if the inspected app launched a [TestAwayMission]
    setStateForMission(harness, TestAwayMission());

    await tester.tap(find.byType(MissionsHistoryItem));

    // check that the expected mission was launched by the widget
    expect(
        harness.recordedMissions, containsA<SelectMission>(withIndex: index));
  });
}

Matcher containsA<T extends SelectMission>({required int withIndex}) {
  return contains(predicate((a) => a is T && a.index == withIndex));
}
