import 'package:flireator/actions/problems/remove_problem.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class RemoveProblemReducer extends TypedReducer<AppState, RemoveProblem> {
  RemoveProblemReducer()
      : super((state, action) {
          // get the next problem to display from the problems list
          final nextProblem =
              (state.problems.isEmpty) ? null : state.problems.last;

          // change the app state to display the next problem
          return state.rebuild((b) => b
            ..problems.remove(nextProblem)
            ..displayProblem = nextProblem?.toBuilder());
        });
}
