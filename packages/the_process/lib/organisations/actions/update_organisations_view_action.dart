import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

part 'update_organisations_view_action.freezed.dart';
part 'update_organisations_view_action.g.dart';

@freezed
class UpdateOrganisationsViewAction
    with _$UpdateOrganisationsViewAction, ReduxAction {
  factory UpdateOrganisationsViewAction(
      {bool? creating,
      OrganisationModel? selected}) = _UpdateOrganisationsViewAction;

  factory UpdateOrganisationsViewAction.fromJson(JsonMap json) =>
      _$UpdateOrganisationsViewActionFromJson(json);
}
