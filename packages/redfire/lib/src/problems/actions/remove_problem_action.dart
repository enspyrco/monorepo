import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/types/redux_action.dart';
import 'package:redfire/src/types/typedefs.dart';

part 'remove_problem_action.freezed.dart';
part 'remove_problem_action.g.dart';

@freezed
class RemoveProblemAction with _$RemoveProblemAction, ReduxAction {
  const RemoveProblemAction._();
  const factory RemoveProblemAction(ProblemInfo info) = _RemoveProblemAction;

  factory RemoveProblemAction.fromJson(JsonMap json) =>
      _$RemoveProblemActionFromJson(json);

  @override
  String get typeName => 'RemoveProblemAction';
}
