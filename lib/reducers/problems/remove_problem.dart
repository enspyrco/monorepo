import 'package:redux/redux.dart';
import 'package:the_process/actions/problems/remove_problem.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/problem_page_data.dart';

class RemoveProblemReducer extends TypedReducer<AppState, RemoveProblem> {
  RemoveProblemReducer()
      : super((state, action) => state.rebuild((b) => b
          ..problems.remove(action.problem)
          ..pagesData.remove(ProblemPageData(problem: action.problem))));
}
