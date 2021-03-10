// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'google_project_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GoogleProjectCredentials _$GoogleProjectCredentialsFromJson(
    Map<String, dynamic> json) {
  return _GoogleProjectCredentials.fromJson(json);
}

/// @nodoc
class _$GoogleProjectCredentialsTearOff {
  const _$GoogleProjectCredentialsTearOff();

  _GoogleProjectCredentials call(
      {required String id,
      required String secret,
      @JsonKey(name: 'redirect_url') required String redirectURL}) {
    return _GoogleProjectCredentials(
      id: id,
      secret: secret,
      redirectURL: redirectURL,
    );
  }

  GoogleProjectCredentials fromJson(Map<String, Object> json) {
    return GoogleProjectCredentials.fromJson(json);
  }
}

/// @nodoc
const $GoogleProjectCredentials = _$GoogleProjectCredentialsTearOff();

/// @nodoc
mixin _$GoogleProjectCredentials {
  String get id;
  String get secret;
  @JsonKey(name: 'redirect_url')
  String get redirectURL;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $GoogleProjectCredentialsCopyWith<GoogleProjectCredentials> get copyWith;
}

/// @nodoc
abstract class $GoogleProjectCredentialsCopyWith<$Res> {
  factory $GoogleProjectCredentialsCopyWith(GoogleProjectCredentials value,
          $Res Function(GoogleProjectCredentials) then) =
      _$GoogleProjectCredentialsCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String secret,
      @JsonKey(name: 'redirect_url') String redirectURL});
}

/// @nodoc
class _$GoogleProjectCredentialsCopyWithImpl<$Res>
    implements $GoogleProjectCredentialsCopyWith<$Res> {
  _$GoogleProjectCredentialsCopyWithImpl(this._value, this._then);

  final GoogleProjectCredentials _value;
  // ignore: unused_field
  final $Res Function(GoogleProjectCredentials) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? secret = freezed,
    Object? redirectURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      secret: secret == freezed ? _value.secret : secret as String,
      redirectURL:
          redirectURL == freezed ? _value.redirectURL : redirectURL as String,
    ));
  }
}

/// @nodoc
abstract class _$GoogleProjectCredentialsCopyWith<$Res>
    implements $GoogleProjectCredentialsCopyWith<$Res> {
  factory _$GoogleProjectCredentialsCopyWith(_GoogleProjectCredentials value,
          $Res Function(_GoogleProjectCredentials) then) =
      __$GoogleProjectCredentialsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String secret,
      @JsonKey(name: 'redirect_url') String redirectURL});
}

/// @nodoc
class __$GoogleProjectCredentialsCopyWithImpl<$Res>
    extends _$GoogleProjectCredentialsCopyWithImpl<$Res>
    implements _$GoogleProjectCredentialsCopyWith<$Res> {
  __$GoogleProjectCredentialsCopyWithImpl(_GoogleProjectCredentials _value,
      $Res Function(_GoogleProjectCredentials) _then)
      : super(_value, (v) => _then(v as _GoogleProjectCredentials));

  @override
  _GoogleProjectCredentials get _value =>
      super._value as _GoogleProjectCredentials;

  @override
  $Res call({
    Object? id = freezed,
    Object? secret = freezed,
    Object? redirectURL = freezed,
  }) {
    return _then(_GoogleProjectCredentials(
      id: id == freezed ? _value.id : id as String,
      secret: secret == freezed ? _value.secret : secret as String,
      redirectURL:
          redirectURL == freezed ? _value.redirectURL : redirectURL as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_GoogleProjectCredentials implements _GoogleProjectCredentials {
  _$_GoogleProjectCredentials(
      {required this.id,
      required this.secret,
      @JsonKey(name: 'redirect_url') required this.redirectURL});

  factory _$_GoogleProjectCredentials.fromJson(Map<String, dynamic> json) =>
      _$_$_GoogleProjectCredentialsFromJson(json);

  @override
  final String id;
  @override
  final String secret;
  @override
  @JsonKey(name: 'redirect_url')
  final String redirectURL;

  @override
  String toString() {
    return 'GoogleProjectCredentials(id: $id, secret: $secret, redirectURL: $redirectURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoogleProjectCredentials &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.secret, secret) ||
                const DeepCollectionEquality().equals(other.secret, secret)) &&
            (identical(other.redirectURL, redirectURL) ||
                const DeepCollectionEquality()
                    .equals(other.redirectURL, redirectURL)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(secret) ^
      const DeepCollectionEquality().hash(redirectURL);

  @JsonKey(ignore: true)
  @override
  _$GoogleProjectCredentialsCopyWith<_GoogleProjectCredentials> get copyWith =>
      __$GoogleProjectCredentialsCopyWithImpl<_GoogleProjectCredentials>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GoogleProjectCredentialsToJson(this);
  }
}

abstract class _GoogleProjectCredentials implements GoogleProjectCredentials {
  factory _GoogleProjectCredentials(
          {required String id,
          required String secret,
          @JsonKey(name: 'redirect_url') required String redirectURL}) =
      _$_GoogleProjectCredentials;

  factory _GoogleProjectCredentials.fromJson(Map<String, dynamic> json) =
      _$_GoogleProjectCredentials.fromJson;

  @override
  String get id;
  @override
  String get secret;
  @override
  @JsonKey(name: 'redirect_url')
  String get redirectURL;
  @override
  @JsonKey(ignore: true)
  _$GoogleProjectCredentialsCopyWith<_GoogleProjectCredentials> get copyWith;
}
