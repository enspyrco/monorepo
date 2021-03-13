library credential_info;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/utils/serializers.dart';

part 'credential_info.g.dart';

abstract class CredentialInfo
    implements Built<CredentialInfo, CredentialInfoBuilder> {
  String get uid;
  String? get token;
  String? get displayName;
  String? get photoURL;

  CredentialInfo._();

  factory CredentialInfo(
      {required String uid,
      required String token,
      required String displayName,
      required String photoURL}) = _$CredentialInfo._;

  factory CredentialInfo.by([void Function(CredentialInfoBuilder) updates]) =
      _$CredentialInfo;

  Object? toJson() =>
      serializers.serializeWith(CredentialInfo.serializer, this);

  static CredentialInfo? fromJson(String jsonString) => serializers
      .deserializeWith(CredentialInfo.serializer, json.decode(jsonString));

  static Serializer<CredentialInfo> get serializer =>
      _$credentialInfoSerializer;
}
