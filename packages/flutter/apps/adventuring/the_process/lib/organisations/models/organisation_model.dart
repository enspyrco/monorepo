import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

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
        ownerIds: Set(),
        adminIds: Set(),
        memberIds: Set(),
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

  factory OrganisationModel.fromJson(Map<String, dynamic> json) =>
      OrganisationModel(
        id: json['id'],
        name: json['name'],
        ownerIds: json['ownerIds'],
        adminIds: json['adminIds'],
        memberIds: json['memberIds'],
      );

  @override
  JsonMap toJson() => {
        'id': id,
        'name': name,
        'ownerIds': [...ownerIds],
        'adminIds': [...adminIds],
        'memberIds': [...memberIds],
      };
}
