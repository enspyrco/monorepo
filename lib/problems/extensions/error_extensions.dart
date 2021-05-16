// Errors in dart are more accurately exceptions and more accurately again
// anything throwable, which is anything.
// So we are actually putting an extension on dynamic here.
import 'package:redfire/problems/actions/add_problem_action.dart';
import 'package:redfire/problems/models/problem_info.dart';

extension ErrorExtension on Object? {
  AddProblemAction toAddProblemAction([StackTrace? trace]) =>
      AddProblemAction(ProblemInfo(toString(), trace.toString()));
}
