// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'id_token_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdTokenResult _$IdTokenResultFromJson(Map<String, dynamic> json) {
  return _IdTokenResult.fromJson(json);
}

/// @nodoc
class _$IdTokenResultTearOff {
  const _$IdTokenResultTearOff();

  _IdTokenResult call(
      {DateTime? authTime,
      Map<String, dynamic>? claims,
      DateTime? expirationTime,
      DateTime? issuedAtTime,
      ProvidersEnum? signInProvider,
      String? token}) {
    return _IdTokenResult(
      authTime: authTime,
      claims: claims,
      expirationTime: expirationTime,
      issuedAtTime: issuedAtTime,
      signInProvider: signInProvider,
      token: token,
    );
  }

  IdTokenResult fromJson(Map<String, Object?> json) {
    return IdTokenResult.fromJson(json);
  }
}

/// @nodoc
const $IdTokenResult = _$IdTokenResultTearOff();

/// @nodoc
mixin _$IdTokenResult {
  /// The authentication time formatted as UTC string. This is the time the user
  /// authenticated (signed in) and not the time the token was refreshed.
  DateTime? get authTime => throw _privateConstructorUsedError;

  /// The entire payload claims of the ID token including the standard reserved
  /// claims as well as the custom claims.
  Map<String, dynamic>? get claims => throw _privateConstructorUsedError;

  /// The time when the ID token expires.
  DateTime? get expirationTime => throw _privateConstructorUsedError;

  /// The time when ID token was issued.
  DateTime? get issuedAtTime => throw _privateConstructorUsedError;

  /// The sign-in provider through which the ID token was obtained (anonymous,
  /// custom, phone, password, etc), converted to [ProvidersEnum].
  ProvidersEnum? get signInProvider => throw _privateConstructorUsedError;

  /// The Firebase Auth ID token JWT string.
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdTokenResultCopyWith<IdTokenResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdTokenResultCopyWith<$Res> {
  factory $IdTokenResultCopyWith(
          IdTokenResult value, $Res Function(IdTokenResult) then) =
      _$IdTokenResultCopyWithImpl<$Res>;
  $Res call(
      {DateTime? authTime,
      Map<String, dynamic>? claims,
      DateTime? expirationTime,
      DateTime? issuedAtTime,
      ProvidersEnum? signInProvider,
      String? token});
}

/// @nodoc
class _$IdTokenResultCopyWithImpl<$Res>
    implements $IdTokenResultCopyWith<$Res> {
  _$IdTokenResultCopyWithImpl(this._value, this._then);

  final IdTokenResult _value;
  // ignore: unused_field
  final $Res Function(IdTokenResult) _then;

  @override
  $Res call({
    Object? authTime = freezed,
    Object? claims = freezed,
    Object? expirationTime = freezed,
    Object? issuedAtTime = freezed,
    Object? signInProvider = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      authTime: authTime == freezed
          ? _value.authTime
          : authTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      claims: claims == freezed
          ? _value.claims
          : claims // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expirationTime: expirationTime == freezed
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      issuedAtTime: issuedAtTime == freezed
          ? _value.issuedAtTime
          : issuedAtTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as ProvidersEnum?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$IdTokenResultCopyWith<$Res>
    implements $IdTokenResultCopyWith<$Res> {
  factory _$IdTokenResultCopyWith(
          _IdTokenResult value, $Res Function(_IdTokenResult) then) =
      __$IdTokenResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? authTime,
      Map<String, dynamic>? claims,
      DateTime? expirationTime,
      DateTime? issuedAtTime,
      ProvidersEnum? signInProvider,
      String? token});
}

/// @nodoc
class __$IdTokenResultCopyWithImpl<$Res>
    extends _$IdTokenResultCopyWithImpl<$Res>
    implements _$IdTokenResultCopyWith<$Res> {
  __$IdTokenResultCopyWithImpl(
      _IdTokenResult _value, $Res Function(_IdTokenResult) _then)
      : super(_value, (v) => _then(v as _IdTokenResult));

  @override
  _IdTokenResult get _value => super._value as _IdTokenResult;

  @override
  $Res call({
    Object? authTime = freezed,
    Object? claims = freezed,
    Object? expirationTime = freezed,
    Object? issuedAtTime = freezed,
    Object? signInProvider = freezed,
    Object? token = freezed,
  }) {
    return _then(_IdTokenResult(
      authTime: authTime == freezed
          ? _value.authTime
          : authTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      claims: claims == freezed
          ? _value.claims
          : claims // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      expirationTime: expirationTime == freezed
          ? _value.expirationTime
          : expirationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      issuedAtTime: issuedAtTime == freezed
          ? _value.issuedAtTime
          : issuedAtTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      signInProvider: signInProvider == freezed
          ? _value.signInProvider
          : signInProvider // ignore: cast_nullable_to_non_nullable
              as ProvidersEnum?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdTokenResult extends _IdTokenResult {
  _$_IdTokenResult(
      {this.authTime,
      this.claims,
      this.expirationTime,
      this.issuedAtTime,
      this.signInProvider,
      this.token})
      : super._();

  factory _$_IdTokenResult.fromJson(Map<String, dynamic> json) =>
      _$$_IdTokenResultFromJson(json);

  @override

  /// The authentication time formatted as UTC string. This is the time the user
  /// authenticated (signed in) and not the time the token was refreshed.
  final DateTime? authTime;
  @override

  /// The entire payload claims of the ID token including the standard reserved
  /// claims as well as the custom claims.
  final Map<String, dynamic>? claims;
  @override

  /// The time when the ID token expires.
  final DateTime? expirationTime;
  @override

  /// The time when ID token was issued.
  final DateTime? issuedAtTime;
  @override

  /// The sign-in provider through which the ID token was obtained (anonymous,
  /// custom, phone, password, etc), converted to [ProvidersEnum].
  final ProvidersEnum? signInProvider;
  @override

  /// The Firebase Auth ID token JWT string.
  final String? token;

  @override
  String toString() {
    return 'IdTokenResult(authTime: $authTime, claims: $claims, expirationTime: $expirationTime, issuedAtTime: $issuedAtTime, signInProvider: $signInProvider, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdTokenResult &&
            const DeepCollectionEquality().equals(other.authTime, authTime) &&
            const DeepCollectionEquality().equals(other.claims, claims) &&
            const DeepCollectionEquality()
                .equals(other.expirationTime, expirationTime) &&
            const DeepCollectionEquality()
                .equals(other.issuedAtTime, issuedAtTime) &&
            const DeepCollectionEquality()
                .equals(other.signInProvider, signInProvider) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authTime),
      const DeepCollectionEquality().hash(claims),
      const DeepCollectionEquality().hash(expirationTime),
      const DeepCollectionEquality().hash(issuedAtTime),
      const DeepCollectionEquality().hash(signInProvider),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$IdTokenResultCopyWith<_IdTokenResult> get copyWith =>
      __$IdTokenResultCopyWithImpl<_IdTokenResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdTokenResultToJson(this);
  }
}

abstract class _IdTokenResult extends IdTokenResult {
  factory _IdTokenResult(
      {DateTime? authTime,
      Map<String, dynamic>? claims,
      DateTime? expirationTime,
      DateTime? issuedAtTime,
      ProvidersEnum? signInProvider,
      String? token}) = _$_IdTokenResult;
  _IdTokenResult._() : super._();

  factory _IdTokenResult.fromJson(Map<String, dynamic> json) =
      _$_IdTokenResult.fromJson;

  @override

  /// The authentication time formatted as UTC string. This is the time the user
  /// authenticated (signed in) and not the time the token was refreshed.
  DateTime? get authTime;
  @override

  /// The entire payload claims of the ID token including the standard reserved
  /// claims as well as the custom claims.
  Map<String, dynamic>? get claims;
  @override

  /// The time when the ID token expires.
  DateTime? get expirationTime;
  @override

  /// The time when ID token was issued.
  DateTime? get issuedAtTime;
  @override

  /// The sign-in provider through which the ID token was obtained (anonymous,
  /// custom, phone, password, etc), converted to [ProvidersEnum].
  ProvidersEnum? get signInProvider;
  @override

  /// The Firebase Auth ID token JWT string.
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$IdTokenResultCopyWith<_IdTokenResult> get copyWith =>
      throw _privateConstructorUsedError;
}
