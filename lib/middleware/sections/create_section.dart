import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/create_section.dart';
import 'package:the_process/actions/sections/update_sections_v_m.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/services/http_service.dart';

class CreateSectionMiddleware extends TypedMiddleware<AppState, CreateSection> {
  CreateSectionMiddleware(HttpService httpService)
      : super((store, action, next) async {
          next(action);

          store.dispatch(UpdateSectionsVM(creatingNewSection: true));

          await httpService.createSection(
            name: store.state.sections?.newSection.name ?? '-',
          );
        });
}
