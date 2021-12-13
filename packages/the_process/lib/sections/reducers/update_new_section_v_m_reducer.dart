import 'package:redux/redux.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/sections/actions/update_new_section_v_m_action.dart';

class UpdateNewSectionVMReducer
    extends TypedReducer<AppState, UpdateNewSectionVMAction> {
  UpdateNewSectionVMReducer()
      : super((state, action) => state.copyWith
            .sections(newName: action.name ?? state.sections.newName));
}
