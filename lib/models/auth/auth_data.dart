library auth_data;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flireator/models/auth/auth_provider_data.dart';
import 'package:flireator/utils/serializers.dart';

part 'auth_data.g.dart';

/// [createdOn] and [lastSignedInOn] are in UTC as required for serialization
abstract class AuthData implements Built<AuthData, AuthDataBuilder> {
  String get uid;
  String? get displayName;
  String? get photoURL;
  String? get email;
  String? get phoneNumber;
  DateTime? get createdOn;
  DateTime get lastSignedInOn;
  bool get isAnonymous;
  bool get emailVerified;
  BuiltList<AuthProviderData> get providers;

  AuthData._();

  @memoized
  bool get hasGitHub => providers
      .where((provider) => provider.providerId == 'github.com')
      .isNotEmpty;

  factory AuthData({
    required String uid,
    required String displayName,
    required String photoURL,
    required String email,
    required String phoneNumber,
    required DateTime createdOn,
    required DateTime lastSignedInOn,
    required bool isAnonymous,
    required bool emailVerified,
    required BuiltList<AuthProviderData> providers,
  }) = _$AuthData._;

  factory AuthData.by([void Function(AuthDataBuilder) updates]) = _$AuthData;

  Object? toJson() => serializers.serializeWith(AuthData.serializer, this);

  static AuthData? fromJson(String jsonString) =>
      serializers.deserializeWith(AuthData.serializer, json.decode(jsonString));

  static Serializer<AuthData> get serializer => _$authDataSerializer;
}
