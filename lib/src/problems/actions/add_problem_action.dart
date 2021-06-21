import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/types/redux_action.dart';

part 'add_problem_action.freezed.dart';
part 'add_problem_action.g.dart';

@freezed
class AddProblemAction with _$AddProblemAction, ReduxAction {
  factory AddProblemAction(ProblemInfo info) = _AddProblemAction;

  factory AddProblemAction.fromJson(Map<String, Object?> json) =>
      _$AddProblemActionFromJson(json);
}
