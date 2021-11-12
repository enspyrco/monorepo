import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'delete_organisation_action.freezed.dart';
part 'delete_organisation_action.g.dart';

@freezed
class DeleteOrganisationAction with _$DeleteOrganisationAction, ReduxAction {
  DeleteOrganisationAction._();
  factory DeleteOrganisationAction() = _DeleteOrganisationAction;

  factory DeleteOrganisationAction.fromJson(JsonMap json) =>
      _$DeleteOrganisationActionFromJson(json);

  @override
  String get typeName => 'DeleteOrganisationAction';
}
