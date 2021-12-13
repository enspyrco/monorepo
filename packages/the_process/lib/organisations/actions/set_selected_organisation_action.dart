import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/organisation_model.dart';

part 'set_selected_organisation_action.freezed.dart';
part 'set_selected_organisation_action.g.dart';

@freezed
class SetSelectedOrganisationAction
    with _$SetSelectedOrganisationAction, ReduxAction {
  const SetSelectedOrganisationAction._();
  const factory SetSelectedOrganisationAction(OrganisationModel? organisation) =
      _SetSelectedOrganisationAction;

  factory SetSelectedOrganisationAction.fromJson(JsonMap json) =>
      _$SetSelectedOrganisationActionFromJson(json);

  @override
  String get typeName => 'SetSelectedOrganisationAction';
}
