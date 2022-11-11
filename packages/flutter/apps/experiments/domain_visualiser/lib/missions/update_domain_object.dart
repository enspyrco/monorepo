import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../app/state/app_state.dart';
import '../models/domain_object.dart';

class UpdateDomainObject extends AwayMission<AppState> {
  const UpdateDomainObject(this.object);

  final DomainObject object;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var service = locate<FirestoreService>();

    await service.updateDocument(
        at: 'domain-objects/${object.id}', to: object.toJson());
  }

  @override
  toJson() => {
        'name_': 'UpdateDomainObject',
        'state_': {'object': object.toJson()}
      };
}
