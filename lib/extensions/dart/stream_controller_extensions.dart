import 'dart:async';

import 'package:flireator/actions/problems/display_problem_action.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/problems/problem.dart';

extension StreamControllerExtension on StreamController<ReduxAction> {
  void addProblem(dynamic error, StackTrace trace) => add(DisplayProblemAction(
      problem: Problem(
          errorString: error.toString(), traceString: trace.toString())));
}
