import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/project_model.dart';

part 'set_projects_action.freezed.dart';
part 'set_projects_action.g.dart';

@freezed
class SetProjectsAction with _$SetProjectsAction, ReduxAction {
  const SetProjectsAction._();
  const factory SetProjectsAction(ISet<ProjectModel> projects) =
      _SetProjectsAction;

  factory SetProjectsAction.fromJson(JsonMap json) =>
      _$SetProjectsActionFromJson(json);

  @override
  String get typeName => 'SetProjectsAction';
}
