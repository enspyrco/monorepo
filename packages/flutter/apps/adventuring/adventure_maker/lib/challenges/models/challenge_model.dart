import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../shared/models/adventure_node.dart';

class ChallengeModel with AdventureNode implements AstroState {
  static const String className = 'ChallengeModel';

  const ChallengeModel({this.id, required this.name});

  @override
  final String name;
  @override
  String get typeName => className;

  final String? id;

  factory ChallengeModel.fromDocument(Document doc) =>
      ChallengeModel(id: doc.id, name: doc.fields['name'] as String);

  factory ChallengeModel.fromJson(JsonMap json) =>
      ChallengeModel(id: json['id'] as String, name: json['name'] as String);

  @override
  AstroState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  JsonMap toJson() => {
        'name': name,
        'type': typeName,
      };
}
