// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'asana_user_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AsanaUserCredentials _$AsanaUserCredentialsFromJson(Map<String, dynamic> json) {
  return _AsanaUserCredentials.fromJson(json);
}

/// @nodoc
class _$AsanaUserCredentialsTearOff {
  const _$AsanaUserCredentialsTearOff();

  _AsanaUserCredentials call(
      {required String refresh_token,
      required String access_token,
      required int expires_in}) {
    return _AsanaUserCredentials(
      refresh_token: refresh_token,
      access_token: access_token,
      expires_in: expires_in,
    );
  }

  AsanaUserCredentials fromJson(Map<String, Object> json) {
    return AsanaUserCredentials.fromJson(json);
  }
}

/// @nodoc
const $AsanaUserCredentials = _$AsanaUserCredentialsTearOff();

/// @nodoc
mixin _$AsanaUserCredentials {
  String get refresh_token;
  String get access_token;
  int get expires_in;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AsanaUserCredentialsCopyWith<AsanaUserCredentials> get copyWith;
}

/// @nodoc
abstract class $AsanaUserCredentialsCopyWith<$Res> {
  factory $AsanaUserCredentialsCopyWith(AsanaUserCredentials value,
          $Res Function(AsanaUserCredentials) then) =
      _$AsanaUserCredentialsCopyWithImpl<$Res>;
  $Res call({String refresh_token, String access_token, int expires_in});
}

/// @nodoc
class _$AsanaUserCredentialsCopyWithImpl<$Res>
    implements $AsanaUserCredentialsCopyWith<$Res> {
  _$AsanaUserCredentialsCopyWithImpl(this._value, this._then);

  final AsanaUserCredentials _value;
  // ignore: unused_field
  final $Res Function(AsanaUserCredentials) _then;

  @override
  $Res call({
    Object? refresh_token = freezed,
    Object? access_token = freezed,
    Object? expires_in = freezed,
  }) {
    return _then(_value.copyWith(
      refresh_token: refresh_token == freezed
          ? _value.refresh_token
          : refresh_token as String,
      access_token: access_token == freezed
          ? _value.access_token
          : access_token as String,
      expires_in: expires_in == freezed ? _value.expires_in : expires_in as int,
    ));
  }
}

/// @nodoc
abstract class _$AsanaUserCredentialsCopyWith<$Res>
    implements $AsanaUserCredentialsCopyWith<$Res> {
  factory _$AsanaUserCredentialsCopyWith(_AsanaUserCredentials value,
          $Res Function(_AsanaUserCredentials) then) =
      __$AsanaUserCredentialsCopyWithImpl<$Res>;
  @override
  $Res call({String refresh_token, String access_token, int expires_in});
}

/// @nodoc
class __$AsanaUserCredentialsCopyWithImpl<$Res>
    extends _$AsanaUserCredentialsCopyWithImpl<$Res>
    implements _$AsanaUserCredentialsCopyWith<$Res> {
  __$AsanaUserCredentialsCopyWithImpl(
      _AsanaUserCredentials _value, $Res Function(_AsanaUserCredentials) _then)
      : super(_value, (v) => _then(v as _AsanaUserCredentials));

  @override
  _AsanaUserCredentials get _value => super._value as _AsanaUserCredentials;

  @override
  $Res call({
    Object? refresh_token = freezed,
    Object? access_token = freezed,
    Object? expires_in = freezed,
  }) {
    return _then(_AsanaUserCredentials(
      refresh_token: refresh_token == freezed
          ? _value.refresh_token
          : refresh_token as String,
      access_token: access_token == freezed
          ? _value.access_token
          : access_token as String,
      expires_in: expires_in == freezed ? _value.expires_in : expires_in as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AsanaUserCredentials implements _AsanaUserCredentials {
  _$_AsanaUserCredentials(
      {required this.refresh_token,
      required this.access_token,
      required this.expires_in});

  factory _$_AsanaUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$_$_AsanaUserCredentialsFromJson(json);

  @override
  final String refresh_token;
  @override
  final String access_token;
  @override
  final int expires_in;

  @override
  String toString() {
    return 'AsanaUserCredentials(refresh_token: $refresh_token, access_token: $access_token, expires_in: $expires_in)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AsanaUserCredentials &&
            (identical(other.refresh_token, refresh_token) ||
                const DeepCollectionEquality()
                    .equals(other.refresh_token, refresh_token)) &&
            (identical(other.access_token, access_token) ||
                const DeepCollectionEquality()
                    .equals(other.access_token, access_token)) &&
            (identical(other.expires_in, expires_in) ||
                const DeepCollectionEquality()
                    .equals(other.expires_in, expires_in)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(refresh_token) ^
      const DeepCollectionEquality().hash(access_token) ^
      const DeepCollectionEquality().hash(expires_in);

  @JsonKey(ignore: true)
  @override
  _$AsanaUserCredentialsCopyWith<_AsanaUserCredentials> get copyWith =>
      __$AsanaUserCredentialsCopyWithImpl<_AsanaUserCredentials>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AsanaUserCredentialsToJson(this);
  }
}

abstract class _AsanaUserCredentials implements AsanaUserCredentials {
  factory _AsanaUserCredentials(
      {required String refresh_token,
      required String access_token,
      required int expires_in}) = _$_AsanaUserCredentials;

  factory _AsanaUserCredentials.fromJson(Map<String, dynamic> json) =
      _$_AsanaUserCredentials.fromJson;

  @override
  String get refresh_token;
  @override
  String get access_token;
  @override
  int get expires_in;
  @override
  @JsonKey(ignore: true)
  _$AsanaUserCredentialsCopyWith<_AsanaUserCredentials> get copyWith;
}
