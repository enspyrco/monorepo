import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/set_projects_action.dart';
import '../actions/tap_projects_action.dart';
import '../models/project_model.dart';

class TapProjectsMiddleware
    extends TypedMiddleware<AppState, TapProjectsAction> {
  TapProjectsMiddleware()
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
            final changes = service.tapCollection(
                at: 'projects',
                where: 'organisationIds',
                arrayContains: action.organisationId);

            // ... and direct the stream to the store.
            _subscription = changes.listen((jsonList) {
              var models = jsonList
                  .map<ProjectModel>(
                      (jsonItem) => ProjectModel.fromJson(jsonItem as JsonMap))
                  .toISet();
              store.dispatch(SetProjectsAction(models));
            }, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
  static StreamSubscription<JsonList>? _subscription;
}
