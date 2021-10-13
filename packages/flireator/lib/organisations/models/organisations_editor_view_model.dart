import 'package:flireator/organisations/models/organisation_creator_view_model.dart';
import 'package:flireator/organisations/models/organisation_selector_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisations_editor_view_model.freezed.dart';
part 'organisations_editor_view_model.g.dart';

@freezed
class OrganisationsEditorViewModel
    with _$OrganisationsEditorViewModel, ReduxModel {
  factory OrganisationsEditorViewModel({
    required OrganisationCreatorViewModel creator,
    required OrganisationSelectorViewModel selector,
  }) = _OrganisationsEditorViewModel;

  factory OrganisationsEditorViewModel.init() => OrganisationsEditorViewModel(
      creator: OrganisationCreatorViewModel(),
      selector: OrganisationSelectorViewModel.init());

  factory OrganisationsEditorViewModel.fromJson(JsonMap json) =>
      _$OrganisationsEditorViewModelFromJson(json);
}
