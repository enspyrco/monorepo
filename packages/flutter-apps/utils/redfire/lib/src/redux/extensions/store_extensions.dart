import 'package:redux/redux.dart';

import '../../problems/actions/add_problem_action.dart';
import '../../problems/models/problem_info.dart';

extension StoreExtension on Store {
  dynamic dispatchProblem(dynamic error, StackTrace? trace) => dispatch(
      AddProblemAction(ProblemInfo(error.toString(), trace?.toString())));
}
