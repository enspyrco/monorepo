import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/set_sections_action.dart';

class SetSectionsReducer extends TypedReducer<AppState, SetSectionsAction> {
  SetSectionsReducer()
      : super((state, action) => state.copyWith.sections(list: action.list));
}
