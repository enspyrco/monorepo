import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/update_sections_v_m_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

class UpdateSectionsVMReducer
    extends TypedReducer<AppState, UpdateSectionsVMAction> {
  UpdateSectionsVMReducer()
      : super((state, action) => state.copyWith
            .sections(creatingNewSection: action.creatingNewSection));
}
