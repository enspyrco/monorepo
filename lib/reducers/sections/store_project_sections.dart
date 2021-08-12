import 'package:redux/redux.dart';
import 'package:the_process/actions/project_sections/store_project_sections_action.dart';

import '../../main.dart';

class StoreProjectSectionsReducer
    extends TypedReducer<AppState, StoreProjectSectionsAction> {
  StoreProjectSectionsReducer()
      : super((state, action) => state.copyWith.sections(list: action.list));
}
