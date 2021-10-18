import 'package:redux/redux.dart';
import 'package:the_process/main.dart';
import 'package:the_process/sections/actions/update_sections_v_m_action.dart';

class UpdateSectionsVMReducer
    extends TypedReducer<AppState, UpdateSectionsVMAction> {
  UpdateSectionsVMReducer()
      : super((state, action) => state.copyWith
            .sections(creatingNewSection: action.creatingNewSection));
}
