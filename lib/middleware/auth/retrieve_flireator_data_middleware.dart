import 'package:flireator/actions/auth/retrieve_flireator_data_action.dart';
import 'package:flireator/actions/flireator/store_flireator_action.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:redux/redux.dart';

class RetrieveFlireatorDataMiddleware
    extends TypedMiddleware<AppState, RetrieveFlireatorDataAction> {
  RetrieveFlireatorDataMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final flireator =
              await databaseService.retrieveFlireatorData(action.userId);
          store.dispatch(StoreFlireatorAction(flireator: flireator));
        });
}
