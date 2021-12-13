import 'package:redux/redux.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/sections/actions/update_sections_v_m_action.dart';

class UpdateSectionsVMReducer
    extends TypedReducer<AppState, UpdateSectionsVMAction> {
  UpdateSectionsVMReducer()
      : super((state, action) => state.copyWith
            .sections(creatingNewSection: action.creatingNewSection));
}
