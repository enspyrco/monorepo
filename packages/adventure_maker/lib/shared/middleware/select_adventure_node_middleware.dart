import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/actions/select_adventure_node_action.dart';
import 'package:adventure_maker/shared/actions/set_adventure_nodes_action.dart';
import 'package:adventure_maker/shared/extensions/json_list_extension.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

class SelectAdventureNodeMiddleware
    extends TypedMiddleware<AppState, SelectAdventureNodeAction> {
  SelectAdventureNodeMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getDatabaseService();

            if (action.selection.isAdventure()) {
              var jsonList = await service.getDocuments(
                  at: 'challenges',
                  where: 'parentIds',
                  arrayContains: (action.selection as AdventureModel).id);
              store.dispatch(SetAdventureNodesAction(jsonList.toChallenges()));
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
