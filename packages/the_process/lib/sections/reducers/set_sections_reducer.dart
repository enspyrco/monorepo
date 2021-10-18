import 'package:redux/redux.dart';
import 'package:the_process/sections/actions/set_sections_action.dart';

import '../../main.dart';

class SetSectionsReducer extends TypedReducer<AppState, SetSectionsAction> {
  SetSectionsReducer()
      : super((state, action) => state.copyWith.sections(list: action.list));
}
