import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'task_model.dart';

part 'tasks_state.freezed.dart';
part 'tasks_state.g.dart';

@freezed
class TasksState with _$TasksState, ReduxState {
  static const String className = 'TasksState';

  const TasksState._();
  const factory TasksState(
      {TaskModel? selected, required ISet<TaskModel> all}) = _TasksState;

  factory TasksState.fromJson(JsonMap json) => _$TasksStateFromJson(json);

  factory TasksState.init() => TasksState(all: ISet());

  @override
  String get typeName => className;
}
