import 'package:redfire/src/problems/actions/add_problem_action.dart';
import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

class AddProblemReducer<T extends RedFireState>
    extends TypedReducer<T, AddProblemAction> {
  AddProblemReducer()
      : super(
          (state, action) => (state as dynamic).copyWith(
            problems: state.problems.add(action.info),
          ) as T,
        );
}
