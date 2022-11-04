import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../_app/state/app_state.dart';
import '../../shared/missions/set_adventure_nodes.dart';
import '../models/challenge_model.dart';

class ReadChallenges extends AwayMission<AppState> {
  const ReadChallenges();

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<FirestoreService>();

    var documents = await service.getDocuments(
      at: 'challenges',
      where: 'parentIds',
      arrayContains: missionControl.state.adventures.selected!,
    );

    var challenges = {
      ...documents.map<ChallengeModel>(
          (document) => ChallengeModel.fromJson(document.fields))
    };

    missionControl.land(SetAdventureNodes(challenges));
  }

  @override
  toJson() => {'name_': 'ReadChallenges', 'state_': <String, dynamic>{}};
}
