import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flireator/organisations/models/organisation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisations_view_model.freezed.dart';
part 'organisations_view_model.g.dart';

@freezed
class OrganisationsViewModel with _$OrganisationsViewModel, ReduxModel {
  factory OrganisationsViewModel({
    /// all current organisations
    required ISet<Organisation> all,

    /// the currently selected organisation
    Organisation? selected,

    /// are we currently creating a new organisation
    @Default(false) bool creating,
  }) = _OrganisationsViewModel;

  factory OrganisationsViewModel.init() => OrganisationsViewModel(all: ISet());

  factory OrganisationsViewModel.fromJson(JsonMap json) =>
      _$OrganisationsViewModelFromJson(json);
}
