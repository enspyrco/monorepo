import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/problems/problem.dart';

part 'remove_problem_action.freezed.dart';
part 'remove_problem_action.g.dart';

@freezed
class RemoveProblemAction with _$RemoveProblemAction, ReduxAction {
  @JsonSerializable(explicitToJson: true)
  factory RemoveProblemAction({required Problem problem}) =
      _RemoveProblemAction;

  factory RemoveProblemAction.fromJson(Map<String, dynamic> json) =>
      _$RemoveProblemActionFromJson(json);
}
