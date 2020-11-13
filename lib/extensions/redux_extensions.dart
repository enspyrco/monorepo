import 'package:redux/redux.dart';
import 'package:the_process/actions/problems/add_problem.dart';
import 'package:the_process/models/app_state/app_state.dart';

extension StoreExt on Store<AppState> {
  dispatchProblem(dynamic error, StackTrace trace) => dispatch(
      AddProblem(errorString: error.toString(), traceString: trace.toString()));
}
