import 'dart:async';

import 'package:adventure_maker/adventures/actions/set_adventures_action.dart';
import 'package:adventure_maker/adventures/actions/tap_adventures_action.dart';
import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class TapAdventuresMiddleware
    extends TypedMiddleware<AppState, TapAdventuresAction> {
  TapAdventuresMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            // If no-one signed in, just return.
            var uid = store.state.auth.userData?.uid;
            if (uid == null) return;

            await _subscription?.cancel();

            // The subscription is cancelled, so to turn off we just return ...
            if (action.turnOff) {
              return;
            }

            // ... otherwise tap the database at the appropriate location...
            final service = RedFireLocator.getDatabaseService();
            final changes = service.tapCollection(
                at: 'adventures', where: 'ownerIds', arrayContains: uid);

            // ... and direct the stream to the store.
            _subscription = changes.listen((jsonList) {
              var adventures = jsonList
                  .map<AdventureModel>((jsonItem) =>
                      AdventureModel.fromJson(jsonItem as JsonMap))
                  .toISet();
              store.dispatch(SetAdventuresAction(adventures));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
  static StreamSubscription<JsonList>? _subscription;
}
