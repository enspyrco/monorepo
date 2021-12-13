import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/set_projects_action.dart';

class SetProjectsReducer extends TypedReducer<AppState, SetProjectsAction> {
  SetProjectsReducer()
      : super((state, action) => state.copyWith.projects(all: action.projects));
}
