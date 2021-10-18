import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel, ReduxModel {
  const factory ProjectModel({required String name}) = _ProjectModel;

  factory ProjectModel.fromJson(JsonMap json) => _$ProjectModelFromJson(json);
}
