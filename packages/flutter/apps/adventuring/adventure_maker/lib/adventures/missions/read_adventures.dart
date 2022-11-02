import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../_app/state/app_state.dart';
import '../../shared/missions/set_adventure_nodes.dart';
import '../models/adventure_model.dart';

class ReadAdventures extends AwayMission<AppState> {
  const ReadAdventures();

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<FirestoreService>();

    List<Document> documents =
        await service.getDocuments(at: 'projects/adventure-maker/adventures');

    var adventures = {...documents.map(AdventureModel.fromDocument)};

    missionControl.land(SetAdventureNodes(adventures));
  }

  @override
  toJson() => {'name_': 'ReadAdventures', 'state_': <String, dynamic>{}};
}
