import 'package:redfire/src/problems/actions/add_problem_action.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redux/redux.dart';

extension StoreExtension on Store {
  dynamic dispatchProblem(dynamic error, StackTrace trace) => dispatch(
      AddProblemAction(ProblemInfo(error.toString(), trace.toString())));
}
