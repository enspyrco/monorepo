// create a function to be called on finding an error
import 'package:flireator/actions/problems/display_problem_action.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/problems/problem.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

Function(dynamic error, StackTrace trace) generateProblemHandler(
        Function(ReduxAction) actionHandler, String location) =>
    (dynamic error, StackTrace trace) {
      final info = <String, Object>{
        'type': error.runtimeType,
        'location': location
      }.lock;
      actionHandler(DisplayProblemAction(
        problem: Problem(
            errorString: error.toString(),
            traceString: trace.toString(),
            info: info),
      ));
    };
