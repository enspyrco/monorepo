import 'package:redux/redux.dart';

import '../../app_state.dart';
import '../actions/update_projects_view_action.dart';

class UpdateProjectsViewReducer
    extends TypedReducer<AppState, UpdateProjectsViewAction> {
  UpdateProjectsViewReducer()
      : super((state, action) {
          final nextCreating = action.creating ?? state.projects.creating;
          return state.copyWith.projects(creating: nextCreating);
        });
}
