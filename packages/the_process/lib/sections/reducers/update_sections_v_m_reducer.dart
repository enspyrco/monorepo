import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/update_sections_v_m_action.dart';

class UpdateSectionsVMReducer
    extends TypedReducer<AppState, UpdateSectionsVMAction> {
  UpdateSectionsVMReducer()
      : super((state, action) => state.copyWith
            .sections(creatingNewSection: action.creatingNewSection));
}
