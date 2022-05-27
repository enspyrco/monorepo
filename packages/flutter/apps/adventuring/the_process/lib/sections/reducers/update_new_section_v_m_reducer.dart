import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/update_new_section_v_m_action.dart';

class UpdateNewSectionVMReducer
    extends TypedReducer<AppState, UpdateNewSectionVMAction> {
  UpdateNewSectionVMReducer()
      : super((state, action) => state.copyWith
            .sections(newName: action.name ?? state.sections.newName));
}
