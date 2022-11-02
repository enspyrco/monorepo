import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../_app/state/app_state.dart';

class CreateAdventureNode extends AwayMission<AppState> {
  const CreateAdventureNode(this.name);

  final String name;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<FirestoreService>();

    var uid = missionControl.state.auth.user.uid;
    if (uid == null) return;

    if (missionControl.state.adventures.selected == null) {
      await service.createDocument(
          at: 'projects/adventure-maker/adventures',
          from: <String, dynamic>{
            'ownerIds': [uid],
            'name': name
          });
      return;
    }

    if (missionControl.state.challenges.selected == null) {
      await service.createDocument(
          at: 'projects/adventure-maker/challenges',
          from: <String, dynamic>{
            'ownerIds': [uid],
            'name': name,
            'parentIds': [missionControl.state.adventures.selected!.id]
          });

      return;
    }

    if (missionControl.state.tasks.selected == null) {
      await service.createDocument(
          at: 'projects/adventure-maker/tasks',
          from: <String, dynamic>{
            'ownerIds': [uid],
            'name': name,
            'parentIds': [missionControl.state.challenges.selected!.id]
          });

      return;
    }

    if (missionControl.state.steps.selected == null) {
      await service.createDocument(
          at: 'projects/adventure-maker/steps',
          from: <String, dynamic>{
            'ownerIds': [uid],
            'name': name,
            'parentIds': [missionControl.state.tasks.selected!.id]
          });

      return;
    }
  }

  @override
  toJson() => {
        'name_': 'CreateAdventureNode',
        'state_': {'name': name}
      };
}
