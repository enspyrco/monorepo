import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../app/state/app_state.dart';
import '../models/organisation_model.dart';
import 'update_organisations_page.dart';

class CreateOrganisation extends AwayMission<AppState> {
  CreateOrganisation(OrganisationModel organisation)
      : _organisation = organisation;

  final OrganisationModel _organisation;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    missionControl.land(UpdateOrganisationsPage(creating: true));

    var organisation =
        _organisation.copyWith(ownerIds: {missionControl.state.auth.user.uid!});

    var service = locate<FirestoreService>();

    try {
      await service.createDocument(
          at: 'organisations', from: organisation.toJson());
    } catch (error) {
      rethrow;
    } finally {
      missionControl.land(UpdateOrganisationsPage(creating: false));
    }
  }

  @override
  toJson() => {'name_': 'CreateOrganisation', 'state_': _organisation.toJson()};
}
