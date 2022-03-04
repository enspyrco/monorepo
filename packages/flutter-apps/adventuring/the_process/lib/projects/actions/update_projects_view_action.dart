import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_projects_view_action.freezed.dart';
part 'update_projects_view_action.g.dart';

@freezed
class UpdateProjectsViewAction with _$UpdateProjectsViewAction, ReduxAction {
  const UpdateProjectsViewAction._();
  const factory UpdateProjectsViewAction({bool? creating}) =
      _UpdateProjectsViewAction;

  factory UpdateProjectsViewAction.fromJson(JsonMap json) =>
      _$UpdateProjectsViewActionFromJson(json);

  @override
  String get typeName => 'UpdateProjectsViewAction';
}
