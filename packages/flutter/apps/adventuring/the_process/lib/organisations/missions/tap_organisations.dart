import 'dart:async';

import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:astro_types/core_types.dart';
import 'package:collection/collection.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../app/state/app_state.dart';
import '../../projects/missions/tap_projects.dart';
import '../models/organisation_model.dart';
import 'set_organisations.dart';
import 'set_selected_organisation.dart';

StreamSubscription<List<Document>>? _subscription;

class TapOrganisations extends AwayMission<AppState> {
  TapOrganisations({bool turnOff = false}) : _turnOff = turnOff;

  final bool _turnOff;

  @override
  Future<void> flightPlan(MissionControl<AppState> missionControl) async {
    await _subscription?.cancel();
    if (_turnOff) return;

    // Tap into the database at the appropriate location
    var service = locate<FirestoreService>();
    final organisationsChanges =
        service.tapIntoCollection(at: 'projects/the-process/organisations');

    // Direct the stream of changes to the store.
    _subscription = organisationsChanges.listen((documents) {
      var organisations = documents
          .map<OrganisationModel>(
              (document) => OrganisationModel.fromDocument(document))
          .toSet();

      // Find any added organisatons.
      var added = organisations
          .difference(missionControl.state.organisations.selector.all)
          .firstOrNull;
      // Find any removed organisatons.
      var removed = missionControl.state.organisations.selector.all
          .difference(organisations)
          .firstOrNull;

      // If an organisation was removed, selected will be set to null.
      // If org was added, it gets set as the selected org.
      // Otherwise leave selected as it was.
      OrganisationModel? nextSelected;
      if (removed == null) {
        nextSelected =
            added ?? missionControl.state.organisations.selector.selected;
      }

      missionControl.land(SetOrganisations(organisations));
      missionControl.land(SetSelectedOrganisation(nextSelected));
      missionControl.launch(TapProjects(organisationId: nextSelected?.id));
    },
        onError: (Object error, StackTrace trace) =>
            missionControl.land(CreateErrorReport(error, trace)));
  }

  @override
  toJson() => {
        'name_': 'TapOrganisations',
        'state_': {'turnOff': _turnOff},
      };
}
