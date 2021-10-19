import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:the_process/organisations/actions/set_organisations_action.dart';
import 'package:the_process/organisations/actions/tap_organisations_action.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

class TapOrganisationsMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, TapOrganisationsAction> {
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

              store.dispatch(SetOrganisationsAction(organisations));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<JsonList>? _subscription;
}
