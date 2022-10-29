// ignore_for_file: not_iterable_spread

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
        ownerIds: <String>{},
        adminIds: <String>{},
        memberIds: <String>{},
        organisationIds: <String>{},
        sectionIds: <String>{},
      );

  factory ProjectState.fromJson(Map<String, dynamic> json) => ProjectState(
        id: json['id'] as String,
        name: json['name'] as String,
        ownerIds: <String>{...json['ownerIds']},
        adminIds: <String>{...json['adminIds']},
        memberIds: <String>{...json['memberIds']},
        organisationIds: <String>{...json['organisationIds']},
        sectionIds: <String>{...json['sectionIds']},
      );

  factory ProjectState.fromDocument(Document doc) => ProjectState(
        id: doc.id,
        name: doc.fields['name'] as String,
        ownerIds: <String>{...doc.fields['ownerIds']},
        adminIds: <String>{...doc.fields['adminIds']},
        memberIds: <String>{...doc.fields['memberIds']},
        organisationIds: <String>{...doc.fields['organisationIds']},
        sectionIds: <String>{...doc.fields['sectionIds']},
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
