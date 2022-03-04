import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/project_model.dart';

part 'create_project_action.freezed.dart';
part 'create_project_action.g.dart';

@freezed
class CreateProjectAction with _$CreateProjectAction, ReduxAction {
  const CreateProjectAction._();
  const factory CreateProjectAction(ProjectModel project) =
      _CreateProjectAction;

  factory CreateProjectAction.fromJson(JsonMap json) =>
      _$CreateProjectActionFromJson(json);

  @override
  String get typeName => 'CreateProjectAction';
}
