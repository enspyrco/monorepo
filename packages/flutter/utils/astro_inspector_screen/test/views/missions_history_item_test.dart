import 'package:astro_inspector_screen/astro_inspector_screen.dart';
import 'package:astro_inspector_screen/src/missions/add_mission_update.dart';
import 'package:astro_inspector_screen/src/missions/select_mission.dart';
import 'package:astro_inspector_screen/src/views/missions_history_view/missions_history_item.dart';
import 'package:astro_test_utils/astro_widgets_test_utils.dart';
import 'package:astro_types/json_types.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/test_away_mission.dart';

void main() {
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
      initialState: InspectorState.initial,
      innerWidget: widgetUnderTest,
    );

    await tester.pumpWidget(harness.widget);

    /// When [SelectMission] is landed by the [widgetUnderTest], we need
    /// the [InspectorState] to have appropriate data or the [land] function will throw.
    /// We could just add appropriate initial state but I think it is clearer
    /// and a better test to start missions to setup the state.

    /// Setup the [InspectorState] as if the inspected app launched a [TestAwayMission]
    harness.land(AddMissionUpdate({
      'state': InspectorState.initial.toJson(),
      'mission': TestAwayMission().toJson()
    }));

    await tester.tap(find.byType(MissionsHistoryItem));

    // check that the expected mission was launched by the widget
    expect(
        harness.recordedMissions, containsA<SelectMission>(withIndex: index));
  });
}

Matcher containsA<T extends SelectMission>({required int withIndex}) {
  return contains(predicate((a) => a is T && a.index == withIndex));
}
