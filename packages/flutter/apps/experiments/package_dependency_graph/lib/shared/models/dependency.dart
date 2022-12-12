import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'dependency_type.dart';

class Dependency implements AstroState {
  const Dependency({
    required this.name,
    required this.package,
    required this.version,
    required this.type,
  });

  final String name;
  final String package;
  final String version;
  final DependencyType type;

  @override
  Dependency copyWith({
    String? name,
    String? package,
    String? version,
    DependencyType? type,
  }) =>
      Dependency(
        name: name ?? this.name,
        package: package ?? this.package,
        version: version ?? this.version,
        type: type ?? this.type,
      );

  @override
  JsonMap toJson() => {
        'name': name,
        'package': package,
        'version': version,
        'type': type,
      };

  @override
  String toString() {
    return '$name, $version, $type';
  }

  @override
  int get hashCode => Object.hash(name, package, version, type);

  @override
  bool operator ==(Object other) =>
      other is Dependency &&
      name == other.name &&
      package == other.package &&
      version == other.version &&
      type == other.type;
}
