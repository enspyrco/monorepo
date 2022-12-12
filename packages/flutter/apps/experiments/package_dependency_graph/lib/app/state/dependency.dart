import 'package:astro_types/state_types.dart';

import 'dependency_type.dart';

class Dependency implements AstroState {
  const Dependency({
    required this.name,
    required this.version,
    required this.type,
  });

  final String name;
  final String version;
  final DependencyType type;

  @override
  AstroState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  String toString() {
    return '$name, $version, $type';
  }
}
