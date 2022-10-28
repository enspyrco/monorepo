import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

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
        ownerIds: {...json['ownerIds']},
        adminIds: {...json['adminIds']},
        memberIds: {...json['memberIds']},
        organisationIds: {...json['organisationIds']},
        sectionIds: {...json['sectionIds']},
      );

  factory ProjectState.fromDocument(Document doc) => ProjectState(
        id: doc.id,
        name: doc.fields['name'],
        ownerIds: {...doc.fields['ownerIds']},
        adminIds: {...doc.fields['adminIds']},
        memberIds: {...doc.fields['memberIds']},
        organisationIds: {...doc.fields['organisationIds']},
        sectionIds: {...doc.fields['sectionIds']},
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
  JsonMap toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'ownerIds': <String>[...ownerIds],
        'adminIds': <String>[...adminIds],
        'memberIds': <String>[...memberIds],
        'organisationIds': <String>[...organisationIds],
        'sectionIds': <String>[...sectionIds],
      };
}
