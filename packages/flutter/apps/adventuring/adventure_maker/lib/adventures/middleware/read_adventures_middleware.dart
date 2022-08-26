import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../../shared/actions/set_adventure_nodes_action.dart';
import '../actions/read_adventures_action.dart';
import '../models/adventure_model.dart';

class ReadAdventuresMiddleware
    extends TypedMiddleware<AppState, ReadAdventuresAction> {
  ReadAdventuresMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getFirestoreService();
            List<Document> documents =
                await service.getDocuments(at: 'adventures');
            var adventures = documents
                .map<AdventureModel>(
                    (jsonItem) => AdventureModel.fromJson(jsonItem as JsonMap))
                .toISet();
            store.dispatch(SetAdventureNodesAction(adventures));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
