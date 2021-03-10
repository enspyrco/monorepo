// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'google_user_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GoogleUserCredentials _$GoogleUserCredentialsFromJson(
    Map<String, dynamic> json) {
  return _GoogleUserCredentials.fromJson(json);
}

/// @nodoc
class _$GoogleUserCredentialsTearOff {
  const _$GoogleUserCredentialsTearOff();

  _GoogleUserCredentials call(
      {@JsonKey(name: 'refresh_token') required String refreshToken,
      @JsonKey(name: 'expiry_date') required int expiryDate,
      @JsonKey(name: 'access_token') required String accessToken,
      @JsonKey(name: 'token_type') required String tokenType,
      @JsonKey(name: 'id_token') required String idToken,
      required String scope}) {
    return _GoogleUserCredentials(
      refreshToken: refreshToken,
      expiryDate: expiryDate,
      accessToken: accessToken,
      tokenType: tokenType,
      idToken: idToken,
      scope: scope,
    );
  }

  GoogleUserCredentials fromJson(Map<String, Object> json) {
    return GoogleUserCredentials.fromJson(json);
  }
}

/// @nodoc
const $GoogleUserCredentials = _$GoogleUserCredentialsTearOff();

/// @nodoc
mixin _$GoogleUserCredentials {
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @JsonKey(name: 'expiry_date')
  int get expiryDate;
  @JsonKey(name: 'access_token')
  String get accessToken;
  @JsonKey(name: 'token_type')
  String get tokenType;
  @JsonKey(name: 'id_token')
  String get idToken;
  String get scope;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GoogleUserCredentialsCopyWith<GoogleUserCredentials> get copyWith;
}

/// @nodoc
abstract class $GoogleUserCredentialsCopyWith<$Res> {
  factory $GoogleUserCredentialsCopyWith(GoogleUserCredentials value,
          $Res Function(GoogleUserCredentials) then) =
      _$GoogleUserCredentialsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expiry_date') int expiryDate,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'id_token') String idToken,
      String scope});
}

/// @nodoc
class _$GoogleUserCredentialsCopyWithImpl<$Res>
    implements $GoogleUserCredentialsCopyWith<$Res> {
  _$GoogleUserCredentialsCopyWithImpl(this._value, this._then);

  final GoogleUserCredentials _value;
  // ignore: unused_field
  final $Res Function(GoogleUserCredentials) _then;

  @override
  $Res call({
    Object? refreshToken = freezed,
    Object? expiryDate = freezed,
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? idToken = freezed,
    Object? scope = freezed,
  }) {
    return _then(_value.copyWith(
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      expiryDate: expiryDate == freezed ? _value.expiryDate : expiryDate as int,
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      tokenType: tokenType == freezed ? _value.tokenType : tokenType as String,
      idToken: idToken == freezed ? _value.idToken : idToken as String,
      scope: scope == freezed ? _value.scope : scope as String,
    ));
  }
}

/// @nodoc
abstract class _$GoogleUserCredentialsCopyWith<$Res>
    implements $GoogleUserCredentialsCopyWith<$Res> {
  factory _$GoogleUserCredentialsCopyWith(_GoogleUserCredentials value,
          $Res Function(_GoogleUserCredentials) then) =
      __$GoogleUserCredentialsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'expiry_date') int expiryDate,
      @JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'id_token') String idToken,
      String scope});
}

/// @nodoc
class __$GoogleUserCredentialsCopyWithImpl<$Res>
    extends _$GoogleUserCredentialsCopyWithImpl<$Res>
    implements _$GoogleUserCredentialsCopyWith<$Res> {
  __$GoogleUserCredentialsCopyWithImpl(_GoogleUserCredentials _value,
      $Res Function(_GoogleUserCredentials) _then)
      : super(_value, (v) => _then(v as _GoogleUserCredentials));

  @override
  _GoogleUserCredentials get _value => super._value as _GoogleUserCredentials;

  @override
  $Res call({
    Object? refreshToken = freezed,
    Object? expiryDate = freezed,
    Object? accessToken = freezed,
    Object? tokenType = freezed,
    Object? idToken = freezed,
    Object? scope = freezed,
  }) {
    return _then(_GoogleUserCredentials(
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      expiryDate: expiryDate == freezed ? _value.expiryDate : expiryDate as int,
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      tokenType: tokenType == freezed ? _value.tokenType : tokenType as String,
      idToken: idToken == freezed ? _value.idToken : idToken as String,
      scope: scope == freezed ? _value.scope : scope as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GoogleUserCredentials implements _GoogleUserCredentials {
  _$_GoogleUserCredentials(
      {@JsonKey(name: 'refresh_token') required this.refreshToken,
      @JsonKey(name: 'expiry_date') required this.expiryDate,
      @JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'token_type') required this.tokenType,
      @JsonKey(name: 'id_token') required this.idToken,
      required this.scope});

  factory _$_GoogleUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$_$_GoogleUserCredentialsFromJson(json);

  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'expiry_date')
  final int expiryDate;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'id_token')
  final String idToken;
  @override
  final String scope;

  @override
  String toString() {
    return 'GoogleUserCredentials(refreshToken: $refreshToken, expiryDate: $expiryDate, accessToken: $accessToken, tokenType: $tokenType, idToken: $idToken, scope: $scope)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoogleUserCredentials &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.expiryDate, expiryDate) ||
                const DeepCollectionEquality()
                    .equals(other.expiryDate, expiryDate)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality()
                    .equals(other.idToken, idToken)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(expiryDate) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(idToken) ^
      const DeepCollectionEquality().hash(scope);

  @JsonKey(ignore: true)
  @override
  _$GoogleUserCredentialsCopyWith<_GoogleUserCredentials> get copyWith =>
      __$GoogleUserCredentialsCopyWithImpl<_GoogleUserCredentials>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GoogleUserCredentialsToJson(this);
  }
}

abstract class _GoogleUserCredentials implements GoogleUserCredentials {
  factory _GoogleUserCredentials(
      {@JsonKey(name: 'refresh_token') required String refreshToken,
      @JsonKey(name: 'expiry_date') required int expiryDate,
      @JsonKey(name: 'access_token') required String accessToken,
      @JsonKey(name: 'token_type') required String tokenType,
      @JsonKey(name: 'id_token') required String idToken,
      required String scope}) = _$_GoogleUserCredentials;

  factory _GoogleUserCredentials.fromJson(Map<String, dynamic> json) =
      _$_GoogleUserCredentials.fromJson;

  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'expiry_date')
  int get expiryDate;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(name: 'id_token')
  String get idToken;
  @override
  String get scope;
  @override
  @JsonKey(ignore: true)
  _$GoogleUserCredentialsCopyWith<_GoogleUserCredentials> get copyWith;
}
