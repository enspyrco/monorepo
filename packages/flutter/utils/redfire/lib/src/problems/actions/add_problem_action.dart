import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_types/json_types.dart';

import '../../types/redux_action.dart';
import '../models/problem_info.dart';

part 'add_problem_action.freezed.dart';
part 'add_problem_action.g.dart';

@freezed
class AddProblemAction with _$AddProblemAction, ReduxAction {
  const AddProblemAction._();
  const factory AddProblemAction(ProblemInfo info) = _AddProblemAction;

  factory AddProblemAction.fromJson(JsonMap json) =>
      _$AddProblemActionFromJson(json);

  @override
  String get typeName => 'AddProblemAction';
}
