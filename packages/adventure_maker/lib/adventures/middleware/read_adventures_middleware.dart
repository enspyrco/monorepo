import 'package:adventure_maker/adventures/actions/read_adventures_action.dart';
import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/actions/set_adventure_nodes_action.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class ReadAdventuresMiddleware
    extends TypedMiddleware<AppState, ReadAdventuresAction> {
  ReadAdventuresMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getDatabaseService();
            JsonList jsonList = await service.getDocuments(at: 'adventures');
            var adventures = jsonList
                .map<AdventureModel>(
                    (jsonItem) => AdventureModel.fromJson(jsonItem as JsonMap))
                .toISet();
            store.dispatch(SetAdventureNodesAction(adventures));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
