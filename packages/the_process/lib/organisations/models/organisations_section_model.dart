import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'organisation_creator_view_model.dart';
import 'organisation_selector_view_model.dart';

part 'organisations_section_model.freezed.dart';
part 'organisations_section_model.g.dart';

@freezed
class OrganisationsSectionModel with _$OrganisationsSectionModel, ReduxState {
  static const String className = 'OrganisationsSectionModel';

  const OrganisationsSectionModel._();
  factory OrganisationsSectionModel({
    required OrganisationCreatorViewModel creator,
    required OrganisationSelectorViewModel selector,
    required bool deleting,
  }) = _OrganisationsSectionModel;

  factory OrganisationsSectionModel.init() => OrganisationsSectionModel(
      creator: OrganisationCreatorViewModel(),
      selector: OrganisationSelectorViewModel.init(),
      deleting: false);

  factory OrganisationsSectionModel.fromJson(JsonMap json) =>
      _$OrganisationsSectionModelFromJson(json);

  @override
  String get typeName => className;
}
