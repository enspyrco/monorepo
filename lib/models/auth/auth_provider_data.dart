library auth_provider_data;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/serializers.dart';

part 'auth_provider_data.g.dart';

abstract class AuthProviderData extends Object
    with ReduxAction
    implements Built<AuthProviderData, AuthProviderDataBuilder> {
  /// The provider identifier.
  String get providerId;

  /// The provider’s user ID for the user.
  String get uid;

  /// The name of the user.
  String? get displayName;

  /// The URL of the user’s profile photo.
  String? get photoURL;

  /// The user’s email address.
  String? get email;

  /// The user's phone number.
  String? get phoneNumber;

  AuthProviderData._();

  factory AuthProviderData({
    required String providerId,
    required String uid,
    String? displayName,
    String? photoURL,
    String? email,
    String? phoneNumber,
  }) = _$AuthProviderData._;

  factory AuthProviderData.by(
      [void Function(AuthProviderDataBuilder) updates]) = _$AuthProviderData;

  Object toJson() =>
      serializers.serializeWith(AuthProviderData.serializer, this);

  // static AuthProviderData fromJson(String jsonString) => serializers
  //     .deserializeWith(AuthProviderData.serializer, json.decode(jsonString));

  static Serializer<AuthProviderData> get serializer =>
      _$authProviderDataSerializer;

  @override
  String toString() => 'AUTH_PROVIDER_DATA';
}
