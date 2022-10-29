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
      OrganisationSelectorViewModel(all: <OrganisationModel>{});

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
  toJson() => {
        'selected': selected?.toJson(),
        'all': all.map((OrganisationModel e) => e.toJson).toList(),
      };
}
