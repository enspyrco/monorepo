import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'class_box.dart';

abstract class DomainObject {
  const DomainObject();

  /// The id of the DomainObject
  String get id;

  JsonMap toJson();
  String get typeName => throw UnimplementedError();
}

class DomainObjectConverter implements JsonConverter<DomainObject, JsonMap> {
  const DomainObjectConverter();

  @override
  DomainObject fromJson(JsonMap json) {
    if (json['type'] == ClassBox.className) {
      return ClassBox.fromJson(json);
    }

    throw Exception('No entry for \'type\' ${json['type']}');
  }

  @override
  JsonMap toJson(DomainObject data) {
    final json = data.toJson();
    json['type'] = data.typeName;
    return json;
  }
}
