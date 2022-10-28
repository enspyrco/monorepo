import 'package:astro_types/state_types.dart';

import 'organisation_model.dart';

class OrganisationSelectorViewModel with AstroState {
  OrganisationSelectorViewModel({
    this.selected,
    required this.all,
  });

  final OrganisationModel? selected;
  final Set<OrganisationModel> all;

  static OrganisationSelectorViewModel get initial =>
      OrganisationSelectorViewModel(all: Set());

  @override
  OrganisationSelectorViewModel copyWith({
    OrganisationModel? selected,
    Set<OrganisationModel>? all,
  }) =>
      OrganisationSelectorViewModel(
        selected: selected ?? this.selected,
        all: all ?? this.all,
      );

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
