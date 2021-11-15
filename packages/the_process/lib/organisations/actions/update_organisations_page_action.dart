import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_organisations_page_action.freezed.dart';
part 'update_organisations_page_action.g.dart';

@freezed
class UpdateOrganisationsPageAction
    with _$UpdateOrganisationsPageAction, ReduxAction {
  const UpdateOrganisationsPageAction._();
  const factory UpdateOrganisationsPageAction(
      {bool? creating, bool? deleting}) = _UpdateOrganisationsPageAction;

  factory UpdateOrganisationsPageAction.fromJson(JsonMap json) =>
      _$UpdateOrganisationsPageActionFromJson(json);

  @override
  String get typeName => 'UpdateOrganisationsPageAction';
}
