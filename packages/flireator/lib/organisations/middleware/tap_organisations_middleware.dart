import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flireator/organisations/actions/set_organisations_action.dart';
import 'package:flireator/organisations/actions/tap_organisations_action.dart';
import 'package:flireator/organisations/models/organisation_model.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class TapOrganisationsMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, TapOrganisationsAction> {
  TapOrganisationsMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            await _subscription?.cancel();
            if (action.turnOff) {
              return;
            }

            // Otherwise tap the database at the appropriate location and...
            final service = RedFireLocator.getDatabaseService();
            final organisationsChanges =
                service.tapCollection(at: 'organisations');

            // ... direct the stream to the store.
            _subscription = organisationsChanges.listen((newJsonList) {
              var organisations = newJsonList
                  .map<OrganisationModel>((jsonItem) =>
                      OrganisationModel.fromJson(jsonItem as JsonMap))
                  .toISet();

              store.dispatch(SetOrganisationsAction(organisations));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<JsonList>? _subscription;
}
