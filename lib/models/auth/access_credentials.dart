library access_credentials;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/serializers.dart';

part 'access_credentials.g.dart';

abstract class AccessCredentials
    implements Built<AccessCredentials, AccessCredentialsBuilder> {
  /// An access token.
  String get accessToken;

  /// A refresh token, which can be used to refresh the access credentials.
  ///
  /// This field may be null.
  String get refreshToken;

  /// A JWT used in calls to Google APIs that accept an id_token param.
  String get idToken;

  /// Scopes these credentials are valid for.
  BuiltList<String> get scopes;

  AccessCredentials._();

  factory AccessCredentials(
      {required String accessToken,
      required String refreshToken,
      required String idToken,
      required BuiltList<String> scopes}) = _$AccessCredentials._;

  factory AccessCredentials.by(
      [void Function(AccessCredentialsBuilder) updates]) = _$AccessCredentials;

  Object toJson() =>
      serializers.serializeWith(AccessCredentials.serializer, this);

  // static AccessCredentials fromJson(String jsonString) => serializers
  //     .deserializeWith(AccessCredentials.serializer, json.decode(jsonString));

  static Serializer<AccessCredentials> get serializer =>
      _$accessCredentialsSerializer;
}
