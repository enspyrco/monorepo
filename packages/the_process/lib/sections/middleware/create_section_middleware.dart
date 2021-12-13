import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/create_section_action.dart';
import '../actions/update_sections_v_m_action.dart';

class CreateSectionMiddleware
    extends TypedMiddleware<AppState, CreateSectionAction> {
  CreateSectionMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final service = RedFireLocator.getHttpService();

            store.dispatch(
                const UpdateSectionsVMAction(creatingNewSection: true));

            await service.createSection(name: store.state.sections.newName);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}
