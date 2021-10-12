import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_organisations_view_model_action.freezed.dart';
part 'update_organisations_view_model_action.g.dart';

@freezed
class UpdateOrganisationsViewModelAction
    with _$UpdateOrganisationsViewModelAction, ReduxAction {
  factory UpdateOrganisationsViewModelAction({bool? creating}) =
      _UpdateOrganisationsViewModelAction;

  factory UpdateOrganisationsViewModelAction.fromJson(JsonMap json) =>
      _$UpdateOrganisationsViewModelActionFromJson(json);
}
