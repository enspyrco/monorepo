import 'package:astro_types/navigation_types.dart';
import 'package:astro_types/state_types.dart';

class ManageOrganisationsPageState<T extends AstroState>
    implements PageState, AstroState {
  const ManageOrganisationsPageState();

  @override
  ManageOrganisationsPageState<T> copyWith() => this;

  @override
  toJson() => {'type': 'ManageOrganisationsPageState'};
}
