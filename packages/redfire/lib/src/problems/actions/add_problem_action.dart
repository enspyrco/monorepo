import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'add_problem_action.freezed.dart';
part 'add_problem_action.g.dart';

@freezed
class AddProblemAction with _$AddProblemAction, ReduxAction {
  AddProblemAction._();
  factory AddProblemAction(ProblemInfo info) = _AddProblemAction;

  factory AddProblemAction.fromJson(JsonMap json) =>
      _$AddProblemActionFromJson(json);

  @override
  String get typeName => 'AddProblemAction';
}
