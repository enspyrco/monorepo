import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
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
            _subscription = firestoreService
                .tapIntoCollection(at: 'sections')
                .listen((documents) {
              store.dispatch(SetSectionsAction(
                  list: documents
                      .map((document) => SectionModel.fromJson(document.fields))
                      .toIList()));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });

  static StreamSubscription<List<Document>>? _subscription;
}
