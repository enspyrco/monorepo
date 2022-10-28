import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../models/organisation_model.dart';

class SetSelectedOrganisation extends LandingMission<AppState> {
  SetSelectedOrganisation(this.organisation);

  final OrganisationModel? organisation;

  @override
  AppState landingInstructions(AppState state) {
    var newSelector =
        state.organisations.selector.copyWith(selected: organisation);
    var newOrganisations = state.organisations.copyWith(selector: newSelector);
    return state.copyWith(organisations: newOrganisations);
  }

  @override
  toJson() => {
        'name_': 'SetSelectedOrganisation',
        'type_': 'sync',
        'id_': hashCode,
        'parent_': parent?.hashCode,
        'state_': organisation?.toJson()
      };
}
