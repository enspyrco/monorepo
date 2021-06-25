import 'package:redux/redux.dart';
import 'package:the_process/actions/shared/connect_database_action.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';

class CloseDatabaseSinkMiddleware
    extends TypedMiddleware<AppState, ConnectDatabaseAction> {
  CloseDatabaseSinkMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          try {
            databaseService.disconnect(action.section);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
