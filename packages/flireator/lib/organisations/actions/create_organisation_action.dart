import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'create_organisation_action.freezed.dart';
part 'create_organisation_action.g.dart';

@freezed
class CreateOrganisationAction with _$CreateOrganisationAction, ReduxAction {
  factory CreateOrganisationAction(String name) = _CreateOrganisationAction;

  factory CreateOrganisationAction.fromJson(JsonMap json) =>
      _$CreateOrganisationActionFromJson(json);
}
