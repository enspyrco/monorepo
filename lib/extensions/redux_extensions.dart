import 'package:redux/redux.dart';
import 'package:the_process/actions/problems/add_problem_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

extension StoreExt on Store<AppState> {
  dynamic dispatchProblem(dynamic error, StackTrace trace) =>
      dispatch(AddProblemAction(
          errorString: error.toString(), traceString: trace.toString()));
}
