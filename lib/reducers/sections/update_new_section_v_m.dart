import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/update_new_section_v_m_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class UpdateNewSectionVMReducer
    extends TypedReducer<AppState, UpdateNewSectionVMAction> {
  UpdateNewSectionVMReducer()
      : super((state, action) => state.copyWith.sections
            .newSection(name: action.name ?? state.sections.newSection.name));
}
