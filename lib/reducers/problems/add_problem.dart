import 'package:redux/redux.dart';
import 'package:the_process/actions/problems/add_problem.dart';
import 'package:the_process/models/app_state/app_state.dart';

class AddProblemReducer extends TypedReducer<AppState, AddProblem> {
  AddProblemReducer()
      : super((state, action) =>
            state.rebuild((b) => b..problems.add(action.problem)));
}