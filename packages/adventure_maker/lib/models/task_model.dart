import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel, ReduxModel {
  static const String className = 'TaskModel';

  const TaskModel._();
  const factory TaskModel({required String name}) = _TaskModel;

  factory TaskModel.fromJson(JsonMap json) => _$TaskModelFromJson(json);

  @override
  String get typeName => className;
}
