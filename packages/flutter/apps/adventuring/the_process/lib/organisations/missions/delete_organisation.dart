import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../app/state/app_state.dart';
import 'update_organisations_page.dart';

class DeleteOrganisation extends AwayMission<AppState> {
  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    try {
      missionControl.land(UpdateOrganisationsPage(deleting: true));

      var selected = missionControl.state.organisations.selector.selected;
      if (selected == null) return;

      var service = locate<FirestoreService>();

      await service.deleteDocument(at: 'organisations/${selected.id}');
    } catch (error) {
      rethrow;
    } finally {
      missionControl.land(UpdateOrganisationsPage(deleting: false));
    }
  }

  @override
  toJson() => {'name_': 'DeleteOrganisation', 'state_': <String, dynamic>{}};
}
