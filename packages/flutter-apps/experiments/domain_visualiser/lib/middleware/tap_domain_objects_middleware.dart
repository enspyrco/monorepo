import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../actions/set_domain_objects_action.dart';
import '../actions/tap_domain_objects_action.dart';
import '../app_state.dart';
import '../models/domain_object.dart';

class TapDomainObjectsMiddleware
    extends TypedMiddleware<AppState, TapDomainObjectsAction> {
  TapDomainObjectsMiddleware()
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
            final changes = service.tapCollection(at: 'domain-objects');

            // ... and direct the stream to the store.
            _subscription = changes.listen((jsonList) {
              var models = jsonList
                  .map<DomainObject>((jsonItem) => const DomainObjectConverter()
                      .fromJson(jsonItem as JsonMap))
                  .toISet();
              store.dispatch(SetDomainObjectsAction(models));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
  static StreamSubscription<JsonList>? _subscription;
}
