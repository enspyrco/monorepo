// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'asana_project_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AsanaProjectCredentials _$AsanaProjectCredentialsFromJson(
    Map<String, dynamic> json) {
  return _AsanaProjectCredentials.fromJson(json);
}

/// @nodoc
class _$AsanaProjectCredentialsTearOff {
  const _$AsanaProjectCredentialsTearOff();

  _AsanaProjectCredentials call(
      {@JsonKey(name: 'client_id') required String clientId,
      @JsonKey(name: 'client_secret') required String clientSecret,
      @JsonKey(name: 'redirect_uri') required String redirectURI}) {
    return _AsanaProjectCredentials(
      clientId: clientId,
      clientSecret: clientSecret,
      redirectURI: redirectURI,
    );
  }

  AsanaProjectCredentials fromJson(Map<String, Object> json) {
    return AsanaProjectCredentials.fromJson(json);
  }
}

/// @nodoc
const $AsanaProjectCredentials = _$AsanaProjectCredentialsTearOff();

/// @nodoc
mixin _$AsanaProjectCredentials {
  @JsonKey(name: 'client_id')
  String get clientId;
  @JsonKey(name: 'client_secret')
  String get clientSecret;
  @JsonKey(name: 'redirect_uri')
  String get redirectURI;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AsanaProjectCredentialsCopyWith<AsanaProjectCredentials> get copyWith;
}

/// @nodoc
abstract class $AsanaProjectCredentialsCopyWith<$Res> {
  factory $AsanaProjectCredentialsCopyWith(AsanaProjectCredentials value,
          $Res Function(AsanaProjectCredentials) then) =
      _$AsanaProjectCredentialsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'client_id') String clientId,
      @JsonKey(name: 'client_secret') String clientSecret,
      @JsonKey(name: 'redirect_uri') String redirectURI});
}

/// @nodoc
class _$AsanaProjectCredentialsCopyWithImpl<$Res>
    implements $AsanaProjectCredentialsCopyWith<$Res> {
  _$AsanaProjectCredentialsCopyWithImpl(this._value, this._then);

  final AsanaProjectCredentials _value;
  // ignore: unused_field
  final $Res Function(AsanaProjectCredentials) _then;

  @override
  $Res call({
    Object? clientId = freezed,
    Object? clientSecret = freezed,
    Object? redirectURI = freezed,
  }) {
    return _then(_value.copyWith(
      clientId: clientId == freezed ? _value.clientId : clientId as String,
      clientSecret: clientSecret == freezed
          ? _value.clientSecret
          : clientSecret as String,
      redirectURI:
          redirectURI == freezed ? _value.redirectURI : redirectURI as String,
    ));
  }
}

/// @nodoc
abstract class _$AsanaProjectCredentialsCopyWith<$Res>
    implements $AsanaProjectCredentialsCopyWith<$Res> {
  factory _$AsanaProjectCredentialsCopyWith(_AsanaProjectCredentials value,
          $Res Function(_AsanaProjectCredentials) then) =
      __$AsanaProjectCredentialsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'client_id') String clientId,
      @JsonKey(name: 'client_secret') String clientSecret,
      @JsonKey(name: 'redirect_uri') String redirectURI});
}

/// @nodoc
class __$AsanaProjectCredentialsCopyWithImpl<$Res>
    extends _$AsanaProjectCredentialsCopyWithImpl<$Res>
    implements _$AsanaProjectCredentialsCopyWith<$Res> {
  __$AsanaProjectCredentialsCopyWithImpl(_AsanaProjectCredentials _value,
      $Res Function(_AsanaProjectCredentials) _then)
      : super(_value, (v) => _then(v as _AsanaProjectCredentials));

  @override
  _AsanaProjectCredentials get _value =>
      super._value as _AsanaProjectCredentials;

  @override
  $Res call({
    Object? clientId = freezed,
    Object? clientSecret = freezed,
    Object? redirectURI = freezed,
  }) {
    return _then(_AsanaProjectCredentials(
      clientId: clientId == freezed ? _value.clientId : clientId as String,
      clientSecret: clientSecret == freezed
          ? _value.clientSecret
          : clientSecret as String,
      redirectURI:
          redirectURI == freezed ? _value.redirectURI : redirectURI as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AsanaProjectCredentials implements _AsanaProjectCredentials {
  _$_AsanaProjectCredentials(
      {@JsonKey(name: 'client_id') required this.clientId,
      @JsonKey(name: 'client_secret') required this.clientSecret,
      @JsonKey(name: 'redirect_uri') required this.redirectURI});

  factory _$_AsanaProjectCredentials.fromJson(Map<String, dynamic> json) =>
      _$_$_AsanaProjectCredentialsFromJson(json);

  @override
  @JsonKey(name: 'client_id')
  final String clientId;
  @override
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @override
  @JsonKey(name: 'redirect_uri')
  final String redirectURI;

  @override
  String toString() {
    return 'AsanaProjectCredentials(clientId: $clientId, clientSecret: $clientSecret, redirectURI: $redirectURI)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AsanaProjectCredentials &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.clientSecret, clientSecret) ||
                const DeepCollectionEquality()
                    .equals(other.clientSecret, clientSecret)) &&
            (identical(other.redirectURI, redirectURI) ||
                const DeepCollectionEquality()
                    .equals(other.redirectURI, redirectURI)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(clientSecret) ^
      const DeepCollectionEquality().hash(redirectURI);

  @JsonKey(ignore: true)
  @override
  _$AsanaProjectCredentialsCopyWith<_AsanaProjectCredentials> get copyWith =>
      __$AsanaProjectCredentialsCopyWithImpl<_AsanaProjectCredentials>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AsanaProjectCredentialsToJson(this);
  }
}

abstract class _AsanaProjectCredentials implements AsanaProjectCredentials {
  factory _AsanaProjectCredentials(
          {@JsonKey(name: 'client_id') required String clientId,
          @JsonKey(name: 'client_secret') required String clientSecret,
          @JsonKey(name: 'redirect_uri') required String redirectURI}) =
      _$_AsanaProjectCredentials;

  factory _AsanaProjectCredentials.fromJson(Map<String, dynamic> json) =
      _$_AsanaProjectCredentials.fromJson;

  @override
  @JsonKey(name: 'client_id')
  String get clientId;
  @override
  @JsonKey(name: 'client_secret')
  String get clientSecret;
  @override
  @JsonKey(name: 'redirect_uri')
  String get redirectURI;
  @override
  @JsonKey(ignore: true)
  _$AsanaProjectCredentialsCopyWith<_AsanaProjectCredentials> get copyWith;
}
