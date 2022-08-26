import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../types/redux_action.dart';
import '../models/problem_info.dart';

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
