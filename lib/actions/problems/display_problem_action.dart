import 'package:flireator/models/problems/problem.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../redux_action.dart';

part 'display_problem_action.freezed.dart';
part 'display_problem_action.g.dart';

@freezed
class DisplayProblemAction with _$DisplayProblemAction, ReduxAction {
  factory DisplayProblemAction({required Problem problem}) =
      _DisplayProblemAction;

  factory DisplayProblemAction.fromJson(Map<String, dynamic> json) =>
      _$DisplayProblemActionFromJson(json);
}
