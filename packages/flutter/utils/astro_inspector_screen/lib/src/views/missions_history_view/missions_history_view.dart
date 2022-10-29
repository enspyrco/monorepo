import 'package:astro/astro.dart';
import 'package:astro_types/json_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                        final missionData = missionUpdates[index]['mission'];
                        if (missionData == null) {
                          return Container();
                        }
                        return MissionsHistoryItem(
                          missionName: missionData['name_'],
                          missionType: missionData['type_'],
                          missionState: missionData['state_'],
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
