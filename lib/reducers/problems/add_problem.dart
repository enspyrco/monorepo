import 'package:redux/redux.dart';
import 'package:the_process/actions/problems/add_problem_action.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';

class AddProblemReducer extends TypedReducer<AppState, AddProblemAction> {
  AddProblemReducer()
      : super((state, action) => state.copyWith(
            problems: state.problems.add(action.problem),
            pagesData: state.pagesData.add(ProblemPageData(action.problem))));
}
