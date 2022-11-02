import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'task_model.dart';

class TasksState implements AstroState {
  TasksState({this.selected, required this.all});

  final TaskModel? selected;
  final Set<TaskModel> all;

  factory TasksState.fromJson(JsonMap json) => TasksState(
      all: (json['all'] as List)
          .map((e) => TaskModel.fromJson(e as JsonMap))
          .toSet(),
      selected: TaskModel.fromJson(json['selected'] as JsonMap));

  static TasksState get initial => TasksState(all: <TaskModel>{});

  @override
  TasksState copyWith({
    TaskModel? selected,
    Set<TaskModel>? all,
  }) =>
      TasksState(selected: selected ?? this.selected, all: all ?? this.all);

  @override
  toJson() => {
        'selected': selected?.toJson() ?? <String, dynamic>{},
        'all': all.map((e) => e.toJson()),
      };
}
