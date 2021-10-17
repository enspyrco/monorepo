import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

part 'update_organisation_selector_action.freezed.dart';
part 'update_organisation_selector_action.g.dart';

@freezed
class UpdateOrganisationSelectorAction
    with _$UpdateOrganisationSelectorAction, ReduxAction {
  factory UpdateOrganisationSelectorAction(
      {bool? creating,
      OrganisationModel? selected}) = _UpdateOrganisationSelectorAction;

  factory UpdateOrganisationSelectorAction.fromJson(JsonMap json) =>
      _$UpdateOrganisationSelectorActionFromJson(json);
}
