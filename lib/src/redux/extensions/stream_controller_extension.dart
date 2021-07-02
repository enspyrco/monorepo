import 'dart:async';

import 'package:redfire/actions.dart';
import 'package:redfire/types.dart';

extension StreamControllerExtension on StreamController<ReduxAction> {
  void addProblem(dynamic error, StackTrace trace) =>
      add(AddProblemAction(ProblemInfo('$error', '$trace')));
}
