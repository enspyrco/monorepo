library flireator;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/models/credentials/credential_info.dart';
import 'package:flireator/models/flireator/config_options.dart';
import 'package:flireator/utils/serializers.dart';

part 'flireator.g.dart';

abstract class Flireator implements Built<Flireator, FlireatorBuilder> {
  String get id;
  String get displayName;
  String get photoURL;
  ConfigOptions? get configOptions;
  BuiltMap<String, CredentialInfo> get credentials;

  Flireator._();

  factory Flireator(
      {required String id,
      required String displayName,
      required String photoURL,
      ConfigOptions? configOptions,
      required BuiltMap<String, CredentialInfo> credentials}) = _$Flireator._;

  factory Flireator.by([void Function(FlireatorBuilder) updates]) = _$Flireator;

  Object? toJson() => serializers.serializeWith(Flireator.serializer, this);

  static Flireator? fromJson(String jsonString) => serializers.deserializeWith(
      Flireator.serializer, json.decode(jsonString));

  static Serializer<Flireator> get serializer => _$flireatorSerializer;
}
