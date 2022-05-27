import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/organisation_model.dart';

part 'create_organisation_action.freezed.dart';
part 'create_organisation_action.g.dart';

@freezed
class CreateOrganisationAction with _$CreateOrganisationAction, ReduxAction {
  const CreateOrganisationAction._();
  const factory CreateOrganisationAction(OrganisationModel organisation) =
      _CreateOrganisationAction;

  factory CreateOrganisationAction.fromJson(JsonMap json) =>
      _$CreateOrganisationActionFromJson(json);

  @override
  String get typeName => 'CreateOrganisationAction';
}
