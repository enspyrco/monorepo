// ignore_for_file: not_iterable_spread

import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

class OrganisationModel with AstroState {
  OrganisationModel({
    // A unique id, current implementation is the firestore document id
    required this.id,
    required this.name,
    required this.ownerIds,
    required this.adminIds,
    required this.memberIds,
  });

  final String id;
  final String name;
  final Set<String> ownerIds;
  final Set<String> adminIds;
  final Set<String> memberIds;

  factory OrganisationModel.initWith({required String name}) =>
      OrganisationModel(
        id: '', // temporary value indicating not saved to DB yet
        name: name,
        ownerIds: <String>{},
        adminIds: <String>{},
        memberIds: <String>{},
      );

  @override
  OrganisationModel copyWith({
    String? id,
    String? name,
    Set<String>? ownerIds,
    Set<String>? adminIds,
    Set<String>? memberIds,
  }) =>
      OrganisationModel(
        id: id ?? this.id,
        name: name ?? this.name,
        ownerIds: ownerIds ?? this.ownerIds,
        adminIds: adminIds ?? this.adminIds,
        memberIds: memberIds ?? this.memberIds,
      );

  factory OrganisationModel.fromDocument(Document doc) => OrganisationModel(
        id: doc.id,
        name: doc.fields['name'] as String,
        ownerIds: <String>{...doc.fields['ownerIds']},
        adminIds: <String>{...doc.fields['adminIds']},
        memberIds: <String>{...doc.fields['memberIds']},
      );

  factory OrganisationModel.fromJson(Map<String, dynamic> json) =>
      OrganisationModel(
        id: json['id'] as String,
        name: json['name'] as String,
        ownerIds: <String>{...json['ownerIds']},
        adminIds: <String>{...json['adminIds']},
        memberIds: <String>{...json['memberIds']},
      );

  @override
  JsonMap toJson() => {
        'id': id,
        'name': name,
        'ownerIds': <String>[...ownerIds],
        'adminIds': <String>[...adminIds],
        'memberIds': <String>[...memberIds],
      };
}
