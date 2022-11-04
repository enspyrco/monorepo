import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../shared/models/adventure_node.dart';

class StepModel with AdventureNode implements AstroState {
  static const String className = 'StepModel';

  const StepModel({this.id, required this.name});

  @override
  String get typeName => 'StepModel';
  @override
  final String name;

  final String? id;

  factory StepModel.fromDocument(Document doc) =>
      StepModel(name: doc.fields['name'] as String, id: doc.id);

  factory StepModel.fromJson(JsonMap json) =>
      StepModel(name: json['name'] as String, id: json['id'] as String?);

  @override
  StepModel copyWith({
    String? name,
    String? id,
  }) =>
      StepModel(name: name ?? this.name, id: id ?? this.id);

  @override
  JsonMap toJson() => {
        'name': name,
        'id': id,
      };
}
