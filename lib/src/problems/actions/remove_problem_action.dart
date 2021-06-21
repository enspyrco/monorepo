import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/types/redux_action.dart';

part 'remove_problem_action.freezed.dart';
part 'remove_problem_action.g.dart';

@freezed
class RemoveProblemAction with _$RemoveProblemAction, ReduxAction {
  @JsonSerializable(explicitToJson: true)
  factory RemoveProblemAction({required ProblemInfo info}) =
      _RemoveProblemAction;

  factory RemoveProblemAction.fromJson(Map<String, dynamic> json) =>
      _$RemoveProblemActionFromJson(json);
}
