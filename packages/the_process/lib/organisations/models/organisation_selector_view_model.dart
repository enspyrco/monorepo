import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:the_process/organisations/models/organisation_model.dart';

part 'organisation_selector_view_model.freezed.dart';
part 'organisation_selector_view_model.g.dart';

@freezed
class OrganisationSelectorViewModel
    with _$OrganisationSelectorViewModel, ReduxState {
  static const String className = 'OrganisationSelectorViewModel';

  const OrganisationSelectorViewModel._();
  factory OrganisationSelectorViewModel({
    OrganisationModel? selected,
    required ISet<OrganisationModel> all,
  }) = _OrganisationSelectorViewModel;

  factory OrganisationSelectorViewModel.init() =>
      OrganisationSelectorViewModel(all: ISet());

  factory OrganisationSelectorViewModel.fromJson(JsonMap json) =>
      _$OrganisationSelectorViewModelFromJson(json);

  @override
  String get typeName => className;
}
