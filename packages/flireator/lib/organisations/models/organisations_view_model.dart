import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flireator/organisations/models/organisation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'organisations_view_model.freezed.dart';
part 'organisations_view_model.g.dart';

@freezed
class OrganisationsViewModel with _$OrganisationsViewModel, ReduxModel {
  factory OrganisationsViewModel({
    required ISet<Organisation> all,
    Organisation? selected,
  }) = _OrganisationsViewModel;

  factory OrganisationsViewModel.init() => OrganisationsViewModel(all: ISet());

  factory OrganisationsViewModel.fromJson(JsonMap json) =>
      _$OrganisationsViewModelFromJson(json);
}
