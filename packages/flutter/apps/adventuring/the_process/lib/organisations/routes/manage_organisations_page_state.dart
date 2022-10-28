import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class ManageOrganisationsPageState<T extends AstroState>
    with PageState, AstroState {
  @override
  ManageOrganisationsPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ManageOrganisationsPageState'};
}
