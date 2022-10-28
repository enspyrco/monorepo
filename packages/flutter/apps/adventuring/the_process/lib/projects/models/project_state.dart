import 'package:astro_types/state_types.dart';

class ProjectState with AstroState {
  ProjectState({
    required this.id,
    required this.name,
    required this.ownerIds,
    required this.adminIds,
    required this.memberIds,
    required this.organisationIds,
    required this.sectionIds,
  });

  final String id;
  final String name;
  final Set<String> ownerIds;
  final Set<String> adminIds;
  final Set<String> memberIds;
  final Set<String> organisationIds;
  final Set<String> sectionIds;

  factory ProjectState.initWith({required String name}) => ProjectState(
        id: '',
        name: name,
        ownerIds: Set(),
        adminIds: Set(),
        memberIds: Set(),
        organisationIds: Set(),
        sectionIds: Set(),
      );

  factory ProjectState.fromJson(Map<String, dynamic> json) => ProjectState(
        id: json['id'],
        name: json['name'],
        ownerIds: json['ownerIds'],
        adminIds: json['adminIds'],
        memberIds: json['memberIds'],
        organisationIds: json['organisationIds'],
        sectionIds: json['sectionIds'],
      );

  @override
  ProjectState copyWith({
    String? id,
    String? name,
    Set<String>? ownerIds,
    Set<String>? adminIds,
    Set<String>? memberIds,
    Set<String>? organisationIds,
    Set<String>? sectionIds,
  }) =>
      ProjectState(
        id: id ?? this.id,
        name: name ?? this.name,
        ownerIds: ownerIds ?? this.ownerIds,
        adminIds: adminIds ?? this.adminIds,
        memberIds: memberIds ?? this.memberIds,
        organisationIds: organisationIds ?? this.organisationIds,
        sectionIds: sectionIds ?? this.sectionIds,
      );

  @override
  toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
