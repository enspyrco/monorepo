import 'dart:async';

import 'package:redux/redux.dart';

import '../../redux/extensions/store_extensions.dart';
import '../../types/red_fire_state.dart';
import '../../types/typedefs.dart';
import '../../utils/red_fire_locator.dart';
import '../actions/set_profile_data_action.dart';
import '../actions/tap_profile_action.dart';
import '../models/profile_data.dart';

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

            // Otherwise tap into the firestore at the appropriate location and...
            final firestoreService = RedFireLocator.getFirestoreService();
            final userId = store.state.auth.userData?.uid;
            final profilePath = 'profiles/$userId';
            final profileChanges =
                firestoreService.tapDocument(at: profilePath);

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
