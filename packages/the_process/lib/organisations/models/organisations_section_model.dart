import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/models/organisation_creator_view_model.dart';
import 'package:the_process/organisations/models/organisation_selector_view_model.dart';

part 'organisations_section_model.freezed.dart';
part 'organisations_section_model.g.dart';

@freezed
class OrganisationsSectionModel with _$OrganisationsSectionModel, ReduxModel {
  factory OrganisationsSectionModel({
    required OrganisationCreatorViewModel creator,
    required OrganisationSelectorViewModel selector,
  }) = _OrganisationsSectionModel;

  factory OrganisationsSectionModel.init() => OrganisationsSectionModel(
      creator: OrganisationCreatorViewModel(),
      selector: OrganisationSelectorViewModel.init());

  factory OrganisationsSectionModel.fromJson(JsonMap json) =>
      _$OrganisationsSectionModelFromJson(json);
}