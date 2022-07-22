import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

import '../../adventures/models/adventure_model.dart';
import '../../app_state.dart';
import '../../challenges/models/challenge_model.dart';
import '../../tasks/models/task_model.dart';
import '../actions/select_adventure_node_action.dart';
import '../actions/set_adventure_nodes_action.dart';
import '../extensions/json_list_extension.dart';

class SelectAdventureNodeMiddleware
    extends TypedMiddleware<AppState, SelectAdventureNodeAction> {
  SelectAdventureNodeMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getFirestoreService();

            if (action.selection.isAdventure()) {
              var jsonList = await service.getDocuments(
                  at: 'challenges',
                  where: 'parentIds',
                  arrayContains: (action.selection as AdventureModel).id);
              store.dispatch(SetAdventureNodesAction(jsonList.toChallenges()));

              return;
            }

            if (action.selection.isChallenge()) {
              var jsonList = await service.getDocuments(
                  at: 'tasks',
                  where: 'parentIds',
                  arrayContains: (action.selection as ChallengeModel).id);
              store.dispatch(SetAdventureNodesAction(jsonList.toTasks()));

              return;
            }

            if (action.selection.isTask()) {
              var jsonList = await service.getDocuments(
                  at: 'steps',
                  where: 'parentIds',
                  arrayContains: (action.selection as TaskModel).id);
              store.dispatch(SetAdventureNodesAction(jsonList.toSteps()));

              return;
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
