library auth_user_data;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/auth/auth_provider_data.dart';
import 'package:the_process/serializers.dart';

part 'auth_user_data.g.dart';

/// [createdOn] and [lastSignedInOn] are in UTC as required for serialization
abstract class AuthUserData extends Object
    with ReduxAction
    implements Built<AuthUserData, AuthUserDataBuilder> {
  String get uid;
  @nullable
  String get displayName;
  @nullable
  String get photoURL;
  @nullable
  String get email;
  @nullable
  String get phoneNumber;
  DateTime get createdOn;
  DateTime get lastSignedInOn;
  bool get isAnonymous;
  bool get emailVerified;
  BuiltList<AuthProviderData> get providers;

  @memoized
  bool get hasGitHub => providers
      .where((provider) => provider.providerId == 'github.com')
      .isNotEmpty;

  AuthUserData._();

  factory AuthUserData({
    @required String uid,
    String displayName,
    String photoURL,
    String email,
    String phoneNumber,
    @required DateTime createdOn,
    @required DateTime lastSignedInOn,
    @required bool isAnonymous,
    @required bool emailVerified,
    @required BuiltList<AuthProviderData> providers,
  }) = _$AuthUserData._;

  factory AuthUserData.by([void Function(AuthUserDataBuilder) updates]) =
      _$AuthUserData;

  Object toJson() => serializers.serializeWith(AuthUserData.serializer, this);

  static AuthUserData fromJson(String jsonString) => serializers
      .deserializeWith(AuthUserData.serializer, json.decode(jsonString));

  static Serializer<AuthUserData> get serializer => _$authUserDataSerializer;

  @override
  String toString() => 'AUTH_USER_DATA';
}
