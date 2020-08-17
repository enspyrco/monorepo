import 'package:flireator/actions/problems/display_problem.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

class DisplayProblemReducer extends TypedReducer<AppState, DisplayProblem> {
  DisplayProblemReducer()
      : super((state, action) {
          // if already displaying a problem, add to problems list
          if (state.displayProblem != null) {
            return state.rebuild((b) => b..problems.add(action.problem));
          } // otherwise
          return state
              .rebuild((b) => b..displayProblem.replace(action.problem));
        });
}
