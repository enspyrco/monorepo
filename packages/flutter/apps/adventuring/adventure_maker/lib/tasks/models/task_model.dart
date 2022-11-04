import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../shared/models/adventure_node.dart';

class TaskModel with AdventureNode implements AstroState {
  static const String className = 'TaskModel';

  const TaskModel({
    this.id,
    required this.name,
  });

  @override
  final String name;
  @override
  String get typeName => 'TaskModel';

  final String? id;

  factory TaskModel.fromDocument(Document doc) =>
      TaskModel(id: doc.id, name: doc.fields['name'] as String);

  factory TaskModel.fromJson(JsonMap json) =>
      TaskModel(id: json['id'] as String, name: json['name'] as String);

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
