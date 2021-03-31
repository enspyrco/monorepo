import 'package:redux/redux.dart';
import 'package:the_process/actions/profile/observe_profile_data_action.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';

class ObserveProfileDataMiddleware
    extends TypedMiddleware<AppState, ObserveProfileDataAction> {
  ObserveProfileDataMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          try {
            databaseService.connectProfileData(
                uid: store.state.authUserData?.uid ?? '-');
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
