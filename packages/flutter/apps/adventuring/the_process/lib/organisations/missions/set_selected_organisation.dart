import 'package:astro_types/core_types.dart';

import '../../app/state/app_state.dart';
import '../models/organisation_model.dart';

class SetSelectedOrganisation extends LandingMission<AppState> {
  SetSelectedOrganisation(this.organisation);

  final OrganisationModel? organisation;

  @override
  AppState landingInstructions(AppState state) {
    var newSelector = (organisation == null)
        ? state.organisations.selector.copyWithDeselect()
        : state.organisations.selector.copyWith(selected: organisation);
    var newOrganisations = state.organisations.copyWith(selector: newSelector);
    return state.copyWith(organisations: newOrganisations);
  }

  @override
  toJson() => {
        'name_': 'SetSelectedOrganisation',
        'state_': <String, dynamic>{'organisation': organisation?.toJson()}
      };
}
