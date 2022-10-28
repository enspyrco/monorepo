import 'package:astro_types/state_types.dart';

class OrganisationCreatorViewModel with AstroState {
  OrganisationCreatorViewModel({
    this.name = '',
    this.creating = false,
  });

  /// The organisaiton name
  final String name;

  /// Are we currently creating a new organisation?
  final bool creating;

  @override
  OrganisationCreatorViewModel copyWith({
    String? name,
    bool? creating,
  }) =>
      OrganisationCreatorViewModel(
          creating: creating ?? this.creating, name: name ?? this.name);

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
