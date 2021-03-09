import 'package:redux/redux.dart';
import 'package:the_process/actions/app_init/plumb_streams_action.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/auth_service.dart';
import 'package:the_process/services/database_service.dart';

class PlumbStreamsMiddleware
    extends TypedMiddleware<AppState, PlumbStreamsAction> {
  PlumbStreamsMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          /// We don't manage the subscription as the streams are expected
          /// to stay open for the whole lifetime of the app
          try {
            databaseService.storeStream
                .listen(store.dispatch, onError: store.dispatchProblem);
            authService.storeStream
                .listen(store.dispatch, onError: store.dispatchProblem);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
