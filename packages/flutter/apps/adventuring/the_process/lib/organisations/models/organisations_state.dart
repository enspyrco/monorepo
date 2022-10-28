import 'package:astro_types/state_types.dart';

import 'organisation_creator_view_model.dart';
import 'organisation_selector_view_model.dart';

class OrganisationsState with AstroState {
  OrganisationsState({
    required this.creator,
    required this.selector,
    required this.deleting,
  });

  final OrganisationCreatorViewModel creator;
  final OrganisationSelectorViewModel selector;
  final bool deleting;

  static OrganisationsState get initial => OrganisationsState(
      creator: OrganisationCreatorViewModel(),
      selector: OrganisationSelectorViewModel.initial,
      deleting: false);

  @override
  OrganisationsState copyWith({
    OrganisationCreatorViewModel? creator,
    OrganisationSelectorViewModel? selector,
    bool? deleting,
  }) =>
      OrganisationsState(
        creator: creator ?? this.creator,
        selector: selector ?? this.selector,
        deleting: deleting ?? this.deleting,
      );

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
