import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../../projects/models/section_model.dart';
import '../actions/set_sections_action.dart';
import '../actions/tap_sections_action.dart';

class TapSectionsMiddleware
    extends TypedMiddleware<AppState, TapSectionsAction> {
  TapSectionsMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            _subscription?.cancel();
            if (action.turnOff) {
              return;
            }

            final firestoreService = RedFireLocator.getFirestoreService();

            // Convert json from the database to an action that handles the data,
            // storing in the app state.
            _subscription =
                firestoreService.tapCollection(at: 'sections').listen((json) {
              store.dispatch(SetSectionsAction(
                  list: json
                      .map((e) => SectionModel.fromJson(e as JsonMap))
                      .toIList()));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<JsonList>? _subscription;
}
