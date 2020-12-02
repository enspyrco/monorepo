import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/database_service.dart';

class CreateSectionMiddleware extends TypedMiddleware<AppState, CreateSection> {
  CreateSectionMiddleware(DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          await databaseService.createSection(
              uid: store.state.authUserData.uid,
              name: store.state.sections.newSection.name,
              number: store.state.sections.newSection.number);
        });
}
