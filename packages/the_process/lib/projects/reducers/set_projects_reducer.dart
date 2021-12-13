import 'package:redux/redux.dart';
import 'package:the_process/app_state.dart';
import 'package:the_process/projects/actions/set_projects_action.dart';

class SetProjectsReducer extends TypedReducer<AppState, SetProjectsAction> {
  SetProjectsReducer()
      : super((state, action) => state.copyWith.projects(all: action.projects));
}
