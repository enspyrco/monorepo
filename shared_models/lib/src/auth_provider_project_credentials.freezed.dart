// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_provider_project_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AuthProviderProjectCredentials _$AuthProviderProjectCredentialsFromJson(
    Map<String, dynamic> json) {
  return _AuthProviderProjectCredentials.fromJson(json);
}

/// @nodoc
class _$AuthProviderProjectCredentialsTearOff {
  const _$AuthProviderProjectCredentialsTearOff();

  _AuthProviderProjectCredentials call(
      {required GoogleProjectCredentials google,
      required AsanaProjectCredentials asana}) {
    return _AuthProviderProjectCredentials(
      google: google,
      asana: asana,
    );
  }

  AuthProviderProjectCredentials fromJson(Map<String, Object> json) {
    return AuthProviderProjectCredentials.fromJson(json);
  }
}

/// @nodoc
const $AuthProviderProjectCredentials =
    _$AuthProviderProjectCredentialsTearOff();

/// @nodoc
mixin _$AuthProviderProjectCredentials {
  GoogleProjectCredentials get google;
  AsanaProjectCredentials get asana;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AuthProviderProjectCredentialsCopyWith<AuthProviderProjectCredentials>
      get copyWith;
}

/// @nodoc
abstract class $AuthProviderProjectCredentialsCopyWith<$Res> {
  factory $AuthProviderProjectCredentialsCopyWith(
          AuthProviderProjectCredentials value,
          $Res Function(AuthProviderProjectCredentials) then) =
      _$AuthProviderProjectCredentialsCopyWithImpl<$Res>;
  $Res call({GoogleProjectCredentials google, AsanaProjectCredentials asana});

  $GoogleProjectCredentialsCopyWith<$Res> get google;
  $AsanaProjectCredentialsCopyWith<$Res> get asana;
}

/// @nodoc
class _$AuthProviderProjectCredentialsCopyWithImpl<$Res>
    implements $AuthProviderProjectCredentialsCopyWith<$Res> {
  _$AuthProviderProjectCredentialsCopyWithImpl(this._value, this._then);

  final AuthProviderProjectCredentials _value;
  // ignore: unused_field
  final $Res Function(AuthProviderProjectCredentials) _then;

  @override
  $Res call({
    Object? google = freezed,
    Object? asana = freezed,
  }) {
    return _then(_value.copyWith(
      google: google == freezed
          ? _value.google
          : google as GoogleProjectCredentials,
      asana: asana == freezed ? _value.asana : asana as AsanaProjectCredentials,
    ));
  }

  @override
  $GoogleProjectCredentialsCopyWith<$Res> get google {
    return $GoogleProjectCredentialsCopyWith<$Res>(_value.google, (value) {
      return _then(_value.copyWith(google: value));
    });
  }

  @override
  $AsanaProjectCredentialsCopyWith<$Res> get asana {
    return $AsanaProjectCredentialsCopyWith<$Res>(_value.asana, (value) {
      return _then(_value.copyWith(asana: value));
    });
  }
}

/// @nodoc
abstract class _$AuthProviderProjectCredentialsCopyWith<$Res>
    implements $AuthProviderProjectCredentialsCopyWith<$Res> {
  factory _$AuthProviderProjectCredentialsCopyWith(
          _AuthProviderProjectCredentials value,
          $Res Function(_AuthProviderProjectCredentials) then) =
      __$AuthProviderProjectCredentialsCopyWithImpl<$Res>;
  @override
  $Res call({GoogleProjectCredentials google, AsanaProjectCredentials asana});

  @override
  $GoogleProjectCredentialsCopyWith<$Res> get google;
  @override
  $AsanaProjectCredentialsCopyWith<$Res> get asana;
}

/// @nodoc
class __$AuthProviderProjectCredentialsCopyWithImpl<$Res>
    extends _$AuthProviderProjectCredentialsCopyWithImpl<$Res>
    implements _$AuthProviderProjectCredentialsCopyWith<$Res> {
  __$AuthProviderProjectCredentialsCopyWithImpl(
      _AuthProviderProjectCredentials _value,
      $Res Function(_AuthProviderProjectCredentials) _then)
      : super(_value, (v) => _then(v as _AuthProviderProjectCredentials));

  @override
  _AuthProviderProjectCredentials get _value =>
      super._value as _AuthProviderProjectCredentials;

  @override
  $Res call({
    Object? google = freezed,
    Object? asana = freezed,
  }) {
    return _then(_AuthProviderProjectCredentials(
      google: google == freezed
          ? _value.google
          : google as GoogleProjectCredentials,
      asana: asana == freezed ? _value.asana : asana as AsanaProjectCredentials,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AuthProviderProjectCredentials
    implements _AuthProviderProjectCredentials {
  _$_AuthProviderProjectCredentials(
      {required this.google, required this.asana});

  factory _$_AuthProviderProjectCredentials.fromJson(
          Map<String, dynamic> json) =>
      _$_$_AuthProviderProjectCredentialsFromJson(json);

  @override
  final GoogleProjectCredentials google;
  @override
  final AsanaProjectCredentials asana;

  @override
  String toString() {
    return 'AuthProviderProjectCredentials(google: $google, asana: $asana)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthProviderProjectCredentials &&
            (identical(other.google, google) ||
                const DeepCollectionEquality().equals(other.google, google)) &&
            (identical(other.asana, asana) ||
                const DeepCollectionEquality().equals(other.asana, asana)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(google) ^
      const DeepCollectionEquality().hash(asana);

  @JsonKey(ignore: true)
  @override
  _$AuthProviderProjectCredentialsCopyWith<_AuthProviderProjectCredentials>
      get copyWith => __$AuthProviderProjectCredentialsCopyWithImpl<
          _AuthProviderProjectCredentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthProviderProjectCredentialsToJson(this);
  }
}

abstract class _AuthProviderProjectCredentials
    implements AuthProviderProjectCredentials {
  factory _AuthProviderProjectCredentials(
          {required GoogleProjectCredentials google,
          required AsanaProjectCredentials asana}) =
      _$_AuthProviderProjectCredentials;

  factory _AuthProviderProjectCredentials.fromJson(Map<String, dynamic> json) =
      _$_AuthProviderProjectCredentials.fromJson;

  @override
  GoogleProjectCredentials get google;
  @override
  AsanaProjectCredentials get asana;
  @override
  @JsonKey(ignore: true)
  _$AuthProviderProjectCredentialsCopyWith<_AuthProviderProjectCredentials>
      get copyWith;
}
