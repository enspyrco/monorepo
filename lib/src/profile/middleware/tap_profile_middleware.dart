import 'dart:async';

import 'package:redfire/src/profile/actions/set_profile_data_action.dart';
import 'package:redfire/src/profile/actions/tap_profile_action.dart';
import 'package:redfire/src/profile/models/profile_data.dart';
import 'package:redfire/src/redux/extensions/store_extensions.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redfire/src/utils/red_fire_locator.dart';
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
            final databaseService = RedFireLocator.getDatabaseService();
            final userId = store.state.auth.userData?.uid;
            final profilePath = 'profiles/$userId';
            final profileChanges = databaseService.tapDocument(at: profilePath);

            // ... direct the stream to the store.
            _subscription = profileChanges.listen((event) {
              store.dispatch(
                  SetProfileDataAction(data: ProfileData.fromJson(event)));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<JsonMap>? _subscription;
}
