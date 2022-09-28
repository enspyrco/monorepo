import 'package:astro/widgets/on_state_change_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';

import '../../../astro_inspector_screen.dart';
import 'missions_history_item.dart';

class MissionsHistoryView extends StatelessWidget {
  const MissionsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5), // so starting space is same as the gaps
        Expanded(
          child: SizedBox(
            width: 300,
            child: OnStateChangeBuilder<InspectorState, List<JsonMap>>(
                transformer: (state) => state.missionUpdates,
                builder: (context, missionUpdates) {
                  return ListView.builder(
                      itemCount: missionUpdates.length,
                      itemBuilder: (context, index) {
                        final actionData = missionUpdates[index]['mission'];
                        if (actionData == null) {
                          return Container();
                        }
                        return MissionsHistoryItem(
                          missionName: actionData['name_'],
                          missionType: actionData['type_'],
                          missionState: actionData['state_'],
                          index: index,
                        );
                      });
                }),
          ),
        )
      ],
    );
  }
}
