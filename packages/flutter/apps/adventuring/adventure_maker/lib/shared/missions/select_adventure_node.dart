import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../_app/state/app_state.dart';
import '../../adventures/models/adventure_model.dart';
import '../../challenges/models/challenge_model.dart';
import '../../tasks/models/task_model.dart';
import '../extensions/documents_list_extension.dart';
import '../models/adventure_node.dart';
import 'set_adventure_node_selection.dart';
import 'set_adventure_nodes.dart';

class SelectAdventureNode extends AwayMission<AppState> {
  const SelectAdventureNode(this.selection);

  final AdventureNode selection;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<FirestoreService>();

    missionControl.land(SetAdventureNodeSelection(selection));

    if (selection.isAdventure()) {
      var jsonList = await service.getDocuments(
          at: 'projects/adventure-maker/challenges',
          where: 'parentIds',
          arrayContains: (selection as AdventureModel).id);
      missionControl.land(SetAdventureNodes(jsonList.toChallenges()));

      return;
    }

    if (selection.isChallenge()) {
      var jsonList = await service.getDocuments(
          at: 'projects/adventure-maker/tasks',
          where: 'parentIds',
          arrayContains: (selection as ChallengeModel).id);
      missionControl.land(SetAdventureNodes(jsonList.toTasks()));

      return;
    }

    if (selection.isTask()) {
      var jsonList = await service.getDocuments(
          at: 'projects/adventure-maker/steps',
          where: 'parentIds',
          arrayContains: (selection as TaskModel).id);
      missionControl.land(SetAdventureNodes(jsonList.toSteps()));

      return;
    }
  }

  @override
  JsonMap toJson() => {
        'name_': 'SelectAdventureNode',
        'state_': {'selection': selection.toJson()}
      };
}
