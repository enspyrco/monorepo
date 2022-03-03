import 'package:freezed_annotation/freezed_annotation.dart';

import '../../types/redux_action.dart';
import '../../types/typedefs.dart';
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
