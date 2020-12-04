import 'package:redux/redux.dart';
import 'package:the_process/actions/shared/connect_database.dart';
import 'package:the_process/enums/database/database_section.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';

class ConnectDatabaseMiddleware
    extends TypedMiddleware<AppState, ConnectDatabase> {
  ConnectDatabaseMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          if (action.section == DatabaseSection.sections) {
            databaseService.connectSections();
          }
        });
}
