import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'dependency.dart';

class Package implements AstroState {
  Package({
    required this.dependencies,
    required this.devDependencies,
    required this.name,
    required this.location,
  });

  final Set<Dependency> dependencies;
  final Set<Dependency> devDependencies;
  final String name;
  final String location;

  @override
  Package copyWith({
    Set<Dependency>? dependencies,
    Set<Dependency>? devDependencies,
    String? name,
    String? location,
  }) =>
      Package(
        dependencies: dependencies ?? this.dependencies,
        devDependencies: devDependencies ?? this.devDependencies,
        name: name ?? this.name,
        location: location ?? this.location,
      );

  @override
  JsonMap toJson() => {
        'dependencies': dependencies,
        'devDependencies': devDependencies,
        'name': name,
        'location': location,
      };

  @override
  String toString() {
    return '$dependencies, $devDependencies, $name, $location';
  }

  @override
  int get hashCode =>
      Object.hash(dependencies, devDependencies, name, location);

  @override
  bool operator ==(Object other) =>
      other is Package &&
      dependencies == other.dependencies &&
      devDependencies == other.devDependencies &&
      name == other.name &&
      location == other.location;
}
