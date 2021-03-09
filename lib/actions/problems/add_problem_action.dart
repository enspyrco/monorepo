import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/problems/problem.dart';

part 'add_problem_action.freezed.dart';
part 'add_problem_action.g.dart';

@freezed
class AddProblemAction with _$AddProblemAction, ReduxAction {
  const AddProblemAction._();
  factory AddProblemAction({
    required String errorString,
    String? traceString,
    Map<String, Object>? info,
  }) = _AddProblemAction;

  factory AddProblemAction.fromJson(Map<String, dynamic> json) =>
      _$AddProblemActionFromJson(json);

  Problem get problem =>
      Problem(errorString: errorString, traceString: traceString, info: info);
}
