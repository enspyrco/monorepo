import 'package:redux/redux.dart';
import 'package:the_process/actions/shared/connect_database_action.dart';
import 'package:the_process/enums/database/database_section_enum.dart';
import 'package:the_process/extensions/redux_extensions.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';

class OpenDatabaseSinkMiddleware
    extends TypedMiddleware<AppState, ConnectDatabaseAction> {
  OpenDatabaseSinkMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          try {
            switch (action.section) {
              case DatabaseSectionEnum.sections:
                databaseService.connectSections();
                break;
              case DatabaseSectionEnum.profileData:
                databaseService.connectProfileData(
                    uid: store.state.authUserData?.uid ?? '-');
                break;
              case DatabaseSectionEnum.newEntries:
                break;
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
