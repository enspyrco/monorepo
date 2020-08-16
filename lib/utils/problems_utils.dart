// create a function to be called on finding an error
import 'package:built_collection/built_collection.dart';
import 'package:flireator/actions/problems/display_problem.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/models/problems/problem.dart';

Function(dynamic error, StackTrace trace) generateProblemHandler(
        Function(ReduxAction) actionHandler, String location) =>
    (dynamic error, StackTrace trace) {
      final info = BuiltMap<String, Object>(
          <String, Object>{'type': error.runtimeType, 'location': location});
      actionHandler(DisplayProblem(
        problem: Problem(
            errorString: error.toString(),
            traceString: trace.toString(),
            info: info),
      ));
    };
