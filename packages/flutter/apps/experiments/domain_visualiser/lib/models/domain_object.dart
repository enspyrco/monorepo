import 'package:astro_types/json_types.dart';

import 'class_box.dart';

abstract class DomainObject {
  const DomainObject();

  String get type;
  String get id;
  JsonMap toJson();

  factory DomainObject.fromJson(JsonMap json) {
    if (json['type'] == ClassBox.className) {
      return ClassBox.fromJson(json);
    }

    throw Exception('Id: ${json['id']} No entry for \'type\' ${json['type']}');
  }
}
