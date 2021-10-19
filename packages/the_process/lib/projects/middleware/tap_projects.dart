// import 'dart:async';

// import 'package:redfire/extensions.dart';
// import 'package:redfire/services.dart';
// import 'package:redfire/types.dart';
// import 'package:redux/redux.dart';
// import 'package:the_process/main.dart';
// import 'package:the_process/projects/actions/tap_projects_action.dart';

// class TapProjectsMiddleware
//     extends TypedMiddleware<AppState, TapProjectsAction> {
//   TapProjectsMiddleware()
//       : super((store, action, next) async {
//           next(action);

//           try {
//             await _subscription?.cancel();

//             // The subscription is cancelled, so to turn off we just return ...
//             if (action.turnOff) {
//               return;
//             }

//             // ... otherwise tap the database at the appropriate location...
//             final service = RedFireLocator.getDatabaseService();
//             final changes = service.tapCollection(at: '');

//             // ... and direct the stream to the store.
//             _subscription = changes.listen((jsonList) {
//               var models = jsonList.map<Model>(
//                   (jsonItem) => Model.fromJson(jsonItem as JsonMap).toISet());
//               store.dispatch(SetsAction(models));
//             }, onError: store.dispatchProblem);
//           } catch (error, trace) {
//             store.dispatchProblem(error, trace);
//           }
//         });
//   static StreamSubscription<JsonList>? _subscription;
// }

import 'dart:async';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/projects/actions/set_projects_action.dart';
import 'package:the_process/projects/actions/tap_projects_action.dart';
import 'package:the_process/projects/models/project_model.dart';

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
            final changes = service.tapCollection(at: 'projects');

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
