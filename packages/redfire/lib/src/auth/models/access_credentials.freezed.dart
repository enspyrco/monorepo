// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'access_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccessCredentials _$AccessCredentialsFromJson(Map<String, dynamic> json) {
  return _AccessCredentials.fromJson(json);
}

/// @nodoc
class _$AccessCredentialsTearOff {
  const _$AccessCredentialsTearOff();

  _AccessCredentials call(
      {required String accessToken,
      required String refreshToken,
      required String idToken,
      required IList<String> scopes}) {
    return _AccessCredentials(
      accessToken: accessToken,
      refreshToken: refreshToken,
      idToken: idToken,
      scopes: scopes,
    );
  }

  AccessCredentials fromJson(Map<String, Object?> json) {
    return AccessCredentials.fromJson(json);
  }
}

/// @nodoc
const $AccessCredentials = _$AccessCredentialsTearOff();

/// @nodoc
mixin _$AccessCredentials {
  /// An access token.
  String get accessToken => throw _privateConstructorUsedError;

  /// A refresh token, which can be used to refresh the access credentials.
  ///
  /// This field may be null.
  String get refreshToken => throw _privateConstructorUsedError;

  /// A JWT used in calls to Google APIs that accept an id_token param.
  String get idToken => throw _privateConstructorUsedError;

  /// Scopes these credentials are valid for.
  IList<String> get scopes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessCredentialsCopyWith<AccessCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessCredentialsCopyWith<$Res> {
  factory $AccessCredentialsCopyWith(
          AccessCredentials value, $Res Function(AccessCredentials) then) =
      _$AccessCredentialsCopyWithImpl<$Res>;
  $Res call(
      {String accessToken,
      String refreshToken,
      String idToken,
      IList<String> scopes});
}

/// @nodoc
class _$AccessCredentialsCopyWithImpl<$Res>
    implements $AccessCredentialsCopyWith<$Res> {
  _$AccessCredentialsCopyWithImpl(this._value, this._then);

  final AccessCredentials _value;
  // ignore: unused_field
  final $Res Function(AccessCredentials) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? idToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as IList<String>,
    ));
  }
}

/// @nodoc
abstract class _$AccessCredentialsCopyWith<$Res>
    implements $AccessCredentialsCopyWith<$Res> {
  factory _$AccessCredentialsCopyWith(
          _AccessCredentials value, $Res Function(_AccessCredentials) then) =
      __$AccessCredentialsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String accessToken,
      String refreshToken,
      String idToken,
      IList<String> scopes});
}

/// @nodoc
class __$AccessCredentialsCopyWithImpl<$Res>
    extends _$AccessCredentialsCopyWithImpl<$Res>
    implements _$AccessCredentialsCopyWith<$Res> {
  __$AccessCredentialsCopyWithImpl(
      _AccessCredentials _value, $Res Function(_AccessCredentials) _then)
      : super(_value, (v) => _then(v as _AccessCredentials));

  @override
  _AccessCredentials get _value => super._value as _AccessCredentials;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? idToken = freezed,
    Object? scopes = freezed,
  }) {
    return _then(_AccessCredentials(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      scopes: scopes == freezed
          ? _value.scopes
          : scopes // ignore: cast_nullable_to_non_nullable
              as IList<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccessCredentials implements _AccessCredentials {
  _$_AccessCredentials(
      {required this.accessToken,
      required this.refreshToken,
      required this.idToken,
      required this.scopes});

  factory _$_AccessCredentials.fromJson(Map<String, dynamic> json) =>
      _$$_AccessCredentialsFromJson(json);

  @override

  /// An access token.
  final String accessToken;
  @override

  /// A refresh token, which can be used to refresh the access credentials.
  ///
  /// This field may be null.
  final String refreshToken;
  @override

  /// A JWT used in calls to Google APIs that accept an id_token param.
  final String idToken;
  @override

  /// Scopes these credentials are valid for.
  final IList<String> scopes;

  @override
  String toString() {
    return 'AccessCredentials(accessToken: $accessToken, refreshToken: $refreshToken, idToken: $idToken, scopes: $scopes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccessCredentials &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.scopes, scopes) || other.scopes == scopes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, idToken, scopes);

  @JsonKey(ignore: true)
  @override
  _$AccessCredentialsCopyWith<_AccessCredentials> get copyWith =>
      __$AccessCredentialsCopyWithImpl<_AccessCredentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccessCredentialsToJson(this);
  }
}

abstract class _AccessCredentials implements AccessCredentials {
  factory _AccessCredentials(
      {required String accessToken,
      required String refreshToken,
      required String idToken,
      required IList<String> scopes}) = _$_AccessCredentials;

  factory _AccessCredentials.fromJson(Map<String, dynamic> json) =
      _$_AccessCredentials.fromJson;

  @override

  /// An access token.
  String get accessToken;
  @override

  /// A refresh token, which can be used to refresh the access credentials.
  ///
  /// This field may be null.
  String get refreshToken;
  @override

  /// A JWT used in calls to Google APIs that accept an id_token param.
  String get idToken;
  @override

  /// Scopes these credentials are valid for.
  IList<String> get scopes;
  @override
  @JsonKey(ignore: true)
  _$AccessCredentialsCopyWith<_AccessCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}
