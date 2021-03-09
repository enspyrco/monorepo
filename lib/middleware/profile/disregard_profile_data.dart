import 'package:redux/redux.dart';
import 'package:the_process/actions/profile/disregard_profile_data_action.dart';
import 'package:the_process/enums/database/database_section.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';

class DisregardProfileDataMiddleware
    extends TypedMiddleware<AppState, DisregardProfileDataAction> {
  DisregardProfileDataMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          databaseService.disconnect(DatabaseSection.profileData);
        });
}
