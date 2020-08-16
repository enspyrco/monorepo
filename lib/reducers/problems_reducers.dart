import 'package:flireator/actions/problems/display_problem.dart';
import 'package:flireator/actions/problems/remove_problem.dart';
import 'package:flireator/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final problemsReducers = <AppState Function(AppState, dynamic)>[
  DisplayProblemReducer(),
];

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
