import 'package:redux/redux.dart';
import 'package:the_process/actions/project_sections/update_new_project_section_v_m_action.dart';

import '../../main.dart';

class UpdateNewProjectSectionVMReducer
    extends TypedReducer<AppState, UpdateNewProjectSectionVMAction> {
  UpdateNewProjectSectionVMReducer()
      : super((state, action) => state.copyWith
            .sections(newName: action.name ?? state.sections.newName));
}
