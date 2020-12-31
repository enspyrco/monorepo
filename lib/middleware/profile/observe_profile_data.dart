import 'package:redux/redux.dart';
import 'package:the_process/actions/profile/observe_profile_data.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';

class ObserveProfileDataMiddleware
    extends TypedMiddleware<AppState, ObserveProfileData> {
  ObserveProfileDataMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          databaseService.connectProfileData(
              uid: store.state.authUserData?.uid ?? '-');
        });
}
