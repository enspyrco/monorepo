import 'package:flireator/organisations/models/organisations_editor_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisations_section_model.freezed.dart';
part 'organisations_section_model.g.dart';

@freezed
class OrganisationsSectionModel with _$OrganisationsSectionModel, ReduxModel {
  factory OrganisationsSectionModel({
    required OrganisationsEditorViewModel editor,
  }) = _OrganisationsSectionModel;

  factory OrganisationsSectionModel.init() =>
      OrganisationsSectionModel(editor: OrganisationsEditorViewModel.init());

  factory OrganisationsSectionModel.fromJson(JsonMap json) =>
      _$OrganisationsSectionModelFromJson(json);
}
