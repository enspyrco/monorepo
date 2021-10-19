import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

part 'update_organisations_page_action.freezed.dart';
part 'update_organisations_page_action.g.dart';

@freezed
class UpdateOrganisationsPageAction
    with _$UpdateOrganisationsPageAction, ReduxAction {
  factory UpdateOrganisationsPageAction({bool? creating, bool? deleting}) =
      _UpdateOrganisationsPageAction;

  factory UpdateOrganisationsPageAction.fromJson(JsonMap json) =>
      _$UpdateOrganisationsPageActionFromJson(json);
}
