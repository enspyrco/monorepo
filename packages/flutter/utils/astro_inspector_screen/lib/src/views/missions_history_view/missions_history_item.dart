import 'package:astro_widgets/widgets/state_stream_builder.dart';
import 'package:flutter/material.dart' hide SelectMission;

import '../../extensions/build_context_extension.dart';
import '../../state-management/select_mission.dart';
import '../../state/inspector_state.dart';
import '../../state/viewmodels/mission_history_item_view_model.dart';

class MissionsHistoryItem extends StatelessWidget {
  const MissionsHistoryItem({
    Key? key,
    required this.missionName,
    required this.missionType,
    required this.missionState,
    required this.index,
  }) : super(key: key);

  final String missionName;
  final String missionType;
  final Map<String, dynamic> missionState;
  final int index;

  @override
  Widget build(BuildContext context) {
    var isAsync = missionType == 'async';

    return StateStreamBuilder<InspectorState, MissionHistoryItemViewModel>(
        transformer: (state) {
      return MissionHistoryItemViewModel(
          index == state.selectedIndex, state.lineageFor[index]?.shapeWidgets);
    }, builder: (context, vm) {
      return Stack(
        children: [
          SizedBox(
            height: 80,
            child: Padding(
              padding: EdgeInsets.only(
                  left: isAsync ? 5 : 20,
                  top: 5,
                  right: isAsync ? 20 : 5,
                  bottom: 5),
              child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: isAsync ? Colors.green : Colors.blue,
                        width: vm.isSelected ? 3 : 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(missionName),
                  subtitle: vm.isSelected
                      ? Text(missionState.toString())
                      : Container(),
                  onTap: () => context.land(SelectMission(index)),
                  tileColor: isAsync ? Colors.green[50] : Colors.blue[50]),
            ),
          ),
          if (vm.lineageShapes != null) ...vm.lineageShapes!
        ],
      );
    });
  }
}
