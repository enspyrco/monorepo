import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../app/state/app_state.dart';
import '../models/class_box.dart';
import '../models/domain_object.dart';

class AddDomainObject extends AwayMission<AppState> {
  const AddDomainObject(this.object);

  final DomainObject object;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    var firestoreService = locate<FirestoreService>();

    final String userId = missionControl.state.auth.user.uid!;

    final newObject = (object as ClassBox).copyWith(userId: userId);

    await firestoreService.setDocument(
        at: 'domain-objects/${object.id}', to: newObject.toJson());
  }

  @override
  toJson() => {
        'name_': 'AddDomainObject',
        'state_': object.toJson(),
      };
}
