import 'package:flireator/actions/auth/retrieve_flireator_data.dart';
import 'package:flireator/actions/flireator/store_flireator.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:flireator/services/database/database_service.dart';
import 'package:redux/redux.dart';

class RetrieveFlireatorDataMiddleware
    extends TypedMiddleware<AppState, RetrieveFlireatorData> {
  RetrieveFlireatorDataMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          final flireator =
              await databaseService.retrieveFlireatorData(action.userId);
          store.dispatch(StoreFlireator(flireator: flireator));
        });
}
