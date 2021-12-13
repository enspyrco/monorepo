import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../../projects/actions/tap_projects_action.dart';
import '../actions/set_organisations_action.dart';
import '../actions/set_selected_organisation_action.dart';
import '../actions/tap_organisations_action.dart';
import '../models/organisation_model.dart';

class TapOrganisationsMiddleware
    extends TypedMiddleware<AppState, TapOrganisationsAction> {
  TapOrganisationsMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            await _subscription?.cancel();

            // The subscription is cancelled, so to turn off we just return ...
            if (action.turnOff) {
              return;
            }

            // ... otherwise tap the database at the appropriate location...
            final service = RedFireLocator.getDatabaseService();
            final organisationsChanges =
                service.tapCollection(at: 'organisations');

            // ... and direct the stream to the store.
            _subscription = organisationsChanges.listen((newJsonList) {
              var organisations = newJsonList
                  .map<OrganisationModel>((jsonItem) =>
                      OrganisationModel.fromJson(jsonItem as JsonMap))
                  .toISet();

              // Find any added organisatons.
              var added = organisations
                  .difference(store.state.organisations.selector.all)
                  .firstOrNull;
              // Find any removed organisatons.
              var removed = store.state.organisations.selector.all
                  .difference(organisations)
                  .firstOrNull;

              // If an organisation was removed, selected will be set to null.
              // If org was added, it gets set as the selected org.
              // Otherwise leave selected as it was.
              OrganisationModel? nextSelected;
              if (removed == null) {
                nextSelected =
                    added ?? store.state.organisations.selector.selected;
              }

              store.dispatch(SetOrganisationsAction(organisations));
              store.dispatch(SetSelectedOrganisationAction(nextSelected));
              store.dispatch(
                  TapProjectsAction(organisationId: nextSelected?.id));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<JsonList>? _subscription;
}
