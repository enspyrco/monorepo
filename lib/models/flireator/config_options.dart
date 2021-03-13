library config_options;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/actions/redux_action.dart';
import 'package:flireator/utils/serializers.dart';

part 'config_options.g.dart';

abstract class ConfigOptions extends Object
    with ReduxAction
    implements Built<ConfigOptions, ConfigOptionsBuilder> {
  String get orgName;

  ConfigOptions._();

  factory ConfigOptions({required String orgName}) = _$ConfigOptions._;

  factory ConfigOptions.by([void Function(ConfigOptionsBuilder) updates]) =
      _$ConfigOptions;

  Object? toJson() => serializers.serializeWith(ConfigOptions.serializer, this);

  static ConfigOptions? fromJson(String jsonString) => serializers
      .deserializeWith(ConfigOptions.serializer, json.decode(jsonString));

  static Serializer<ConfigOptions> get serializer => _$configOptionsSerializer;

  @override
  String toString() => 'CONFIG_OPTIONS';
}
