import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:firestore_service_interface/firestore_service_interface.dart';

import '../../shared/models/adventure_node.dart';

class AdventureModel with AdventureNode implements AstroState {
  static const String className = 'AdventureModel';
  const AdventureModel({
    this.id,
    required this.name,
  });

  final String? id;
  @override
  final String name;

  @override
  AstroState copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  factory AdventureModel.fromDocument(Document doc) =>
      AdventureModel(id: doc.id, name: doc.fields['name'] as String);

  factory AdventureModel.fromJson(JsonMap json) =>
      AdventureModel(id: json['id'] as String?, name: json['name'] as String);

  @override
  JsonMap toJson() => {
        'id': id,
        'name': name,
      };

  @override
  String get typeName => className;
}
