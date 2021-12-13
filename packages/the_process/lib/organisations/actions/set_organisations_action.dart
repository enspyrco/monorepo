import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../models/organisation_model.dart';

part 'set_organisations_action.freezed.dart';
part 'set_organisations_action.g.dart';

@freezed
class SetOrganisationsAction with _$SetOrganisationsAction, ReduxAction {
  const SetOrganisationsAction._();
  const factory SetOrganisationsAction(ISet<OrganisationModel> organisations) =
      _SetOrganisationsAction;

  factory SetOrganisationsAction.fromJson(JsonMap json) =>
      _$SetOrganisationsActionFromJson(json);

  @override
  String get typeName => 'SetOrganisationsAction';
}
