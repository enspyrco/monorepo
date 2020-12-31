import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/update_sections_v_m.dart';
import 'package:the_process/models/app_state/app_state.dart';

class UpdateSectionsVMReducer extends TypedReducer<AppState, UpdateSectionsVM> {
  UpdateSectionsVMReducer()
      : super((state, action) => state.rebuild(
            (b) => b..sections.creatingNewSection = action.creatingNewSection));
}
