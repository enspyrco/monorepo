import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

typedef ReduxActionFromJson = ReduxAction Function(JsonMap json);

abstract class ReduxAction {
  JsonMap toJson();
  String get typeName;
}

final _fromJsonMap = <String, ReduxActionFromJson>{};

class ReduxActionConverter implements JsonConverter<ReduxAction?, JsonMap> {
  const ReduxActionConverter();

  @override
  ReduxAction fromJson(JsonMap json) {
    final fromJson = _fromJsonMap[json['type']];
    if (fromJson == null) {
      throw Exception('No entry for \'type\' ${json['type']}');
    }
    return fromJson(json);
  }

  @override
  JsonMap toJson(ReduxAction? data) {
    final json = data?.toJson();
    json?['type'] = data?.typeName;
    return json ?? {};
  }
}
