import 'package:redux/redux.dart';
import 'package:the_process/actions/project_sections/update_project_sections_v_m_action.dart';

import '../../main.dart';

class UpdateProjectSectionsVMReducer
    extends TypedReducer<AppState, UpdateProjectSectionsVMAction> {
  UpdateProjectSectionsVMReducer()
      : super((state, action) => state.copyWith
            .sections(creatingNewSection: action.creatingNewSection));
}
