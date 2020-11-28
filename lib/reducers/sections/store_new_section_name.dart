import 'package:redux/redux.dart';
import 'package:the_process/actions/sections/store_new_section_name.dart';
import 'package:the_process/models/app_state/app_state.dart';

class StoreNewSectionNameReducer
    extends TypedReducer<AppState, StoreNewSectionName> {
  StoreNewSectionNameReducer()
      : super((state, action) =>
            state.rebuild((b) => b..sectionsVM.newSectionName = action.value));
}
