import 'dart:async';

import 'package:redfire/extensions.dart';
import 'package:redfire/src/profile/actions/store_profile_data_action.dart';
import 'package:redfire/src/profile/actions/tap_profile_action.dart';
import 'package:redfire/src/utils/locator.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../types/typedefs.dart';

class TapProfileMiddleware<T extends RedFireState>
    extends TypedMiddleware<T, TapProfileAction> {
  TapProfileMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            await _subscription?.cancel();
            if (action.turnOff) {
              return;
            }

            // Otherwise tap the database at the appropriate location and...
            final databaseService = Locator.getDatabaseService();
            final userId = store.state.auth.userData?.uid;
            final profilePath = 'profiles/$userId';
            final profileChanges =
                databaseService.tapDocumentAt(path: profilePath);

            // ... direct the stream to the store.
            _subscription = profileChanges.listen((event) {
              store.dispatch(
                  StoreProfileDataAction(data: ProfileData.fromJson(event)));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<JsonMap>? _subscription;
}
