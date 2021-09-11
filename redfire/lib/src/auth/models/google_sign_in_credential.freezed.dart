// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'google_sign_in_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GoogleSignInCredential _$GoogleSignInCredentialFromJson(
    Map<String, dynamic> json) {
  return _GoogleSignInCredential.fromJson(json);
}

/// @nodoc
class _$GoogleSignInCredentialTearOff {
  const _$GoogleSignInCredentialTearOff();

  _GoogleSignInCredential call(
      {String? idToken, String? accessToken, String? serverAuthCode}) {
    return _GoogleSignInCredential(
      idToken: idToken,
      accessToken: accessToken,
      serverAuthCode: serverAuthCode,
    );
  }

  GoogleSignInCredential fromJson(Map<String, Object> json) {
    return GoogleSignInCredential.fromJson(json);
  }
}

/// @nodoc
const $GoogleSignInCredential = _$GoogleSignInCredentialTearOff();

/// @nodoc
mixin _$GoogleSignInCredential {
  /// An OpenID Connect ID token that identifies the user.
  String? get idToken => throw _privateConstructorUsedError;

  /// The OAuth2 access token to access Google services.
  String? get accessToken => throw _privateConstructorUsedError;

  /// Server auth code used to access Google Login
  String? get serverAuthCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoogleSignInCredentialCopyWith<GoogleSignInCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSignInCredentialCopyWith<$Res> {
  factory $GoogleSignInCredentialCopyWith(GoogleSignInCredential value,
          $Res Function(GoogleSignInCredential) then) =
      _$GoogleSignInCredentialCopyWithImpl<$Res>;
  $Res call({String? idToken, String? accessToken, String? serverAuthCode});
}

/// @nodoc
class _$GoogleSignInCredentialCopyWithImpl<$Res>
    implements $GoogleSignInCredentialCopyWith<$Res> {
  _$GoogleSignInCredentialCopyWithImpl(this._value, this._then);

  final GoogleSignInCredential _value;
  // ignore: unused_field
  final $Res Function(GoogleSignInCredential) _then;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
    Object? serverAuthCode = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      serverAuthCode: serverAuthCode == freezed
          ? _value.serverAuthCode
          : serverAuthCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GoogleSignInCredentialCopyWith<$Res>
    implements $GoogleSignInCredentialCopyWith<$Res> {
  factory _$GoogleSignInCredentialCopyWith(_GoogleSignInCredential value,
          $Res Function(_GoogleSignInCredential) then) =
      __$GoogleSignInCredentialCopyWithImpl<$Res>;
  @override
  $Res call({String? idToken, String? accessToken, String? serverAuthCode});
}

/// @nodoc
class __$GoogleSignInCredentialCopyWithImpl<$Res>
    extends _$GoogleSignInCredentialCopyWithImpl<$Res>
    implements _$GoogleSignInCredentialCopyWith<$Res> {
  __$GoogleSignInCredentialCopyWithImpl(_GoogleSignInCredential _value,
      $Res Function(_GoogleSignInCredential) _then)
      : super(_value, (v) => _then(v as _GoogleSignInCredential));

  @override
  _GoogleSignInCredential get _value => super._value as _GoogleSignInCredential;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
    Object? serverAuthCode = freezed,
  }) {
    return _then(_GoogleSignInCredential(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      serverAuthCode: serverAuthCode == freezed
          ? _value.serverAuthCode
          : serverAuthCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GoogleSignInCredential implements _GoogleSignInCredential {
  _$_GoogleSignInCredential(
      {this.idToken, this.accessToken, this.serverAuthCode});

  factory _$_GoogleSignInCredential.fromJson(Map<String, dynamic> json) =>
      _$$_GoogleSignInCredentialFromJson(json);

  @override

  /// An OpenID Connect ID token that identifies the user.
  final String? idToken;
  @override

  /// The OAuth2 access token to access Google services.
  final String? accessToken;
  @override

  /// Server auth code used to access Google Login
  final String? serverAuthCode;

  @override
  String toString() {
    return 'GoogleSignInCredential(idToken: $idToken, accessToken: $accessToken, serverAuthCode: $serverAuthCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoogleSignInCredential &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality()
                    .equals(other.idToken, idToken)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.serverAuthCode, serverAuthCode) ||
                const DeepCollectionEquality()
                    .equals(other.serverAuthCode, serverAuthCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idToken) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(serverAuthCode);

  @JsonKey(ignore: true)
  @override
  _$GoogleSignInCredentialCopyWith<_GoogleSignInCredential> get copyWith =>
      __$GoogleSignInCredentialCopyWithImpl<_GoogleSignInCredential>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GoogleSignInCredentialToJson(this);
  }
}

abstract class _GoogleSignInCredential implements GoogleSignInCredential {
  factory _GoogleSignInCredential(
      {String? idToken,
      String? accessToken,
      String? serverAuthCode}) = _$_GoogleSignInCredential;

  factory _GoogleSignInCredential.fromJson(Map<String, dynamic> json) =
      _$_GoogleSignInCredential.fromJson;

  @override

  /// An OpenID Connect ID token that identifies the user.
  String? get idToken => throw _privateConstructorUsedError;
  @override

  /// The OAuth2 access token to access Google services.
  String? get accessToken => throw _privateConstructorUsedError;
  @override

  /// Server auth code used to access Google Login
  String? get serverAuthCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GoogleSignInCredentialCopyWith<_GoogleSignInCredential> get copyWith =>
      throw _privateConstructorUsedError;
}
