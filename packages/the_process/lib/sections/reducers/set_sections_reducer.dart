import 'package:redux/redux.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/sections/actions/set_sections_action.dart';

class SetSectionsReducer extends TypedReducer<AppState, SetSectionsAction> {
  SetSectionsReducer()
      : super((state, action) => state.copyWith.sections(list: action.list));
}
