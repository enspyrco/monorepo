import 'package:redux/redux.dart';
import 'package:the_process/actions/problems/remove_problem_action.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';

class RemoveProblemReducer extends TypedReducer<AppState, RemoveProblemAction> {
  RemoveProblemReducer()
      : super((state, action) => state.copyWith(
            problems: state.problems.copyAndRemove(action.problem),
            pagesData: state.pagesData
                .copyAndRemove(ProblemPageData(action.problem))));
}
