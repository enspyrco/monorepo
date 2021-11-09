// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apple_id_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppleIdCredential _$AppleIdCredentialFromJson(Map<String, dynamic> json) {
  return _AppleIdCredential.fromJson(json);
}

/// @nodoc
class _$AppleIdCredentialTearOff {
  const _$AppleIdCredentialTearOff();

  _AppleIdCredential call(
      {String? userIdentifier,
      String? givenName,
      String? familyName,
      String? email,
      required String authorizationCode,
      String? identityToken,
      String? state}) {
    return _AppleIdCredential(
      userIdentifier: userIdentifier,
      givenName: givenName,
      familyName: familyName,
      email: email,
      authorizationCode: authorizationCode,
      identityToken: identityToken,
      state: state,
    );
  }

  AppleIdCredential fromJson(Map<String, Object?> json) {
    return AppleIdCredential.fromJson(json);
  }
}

/// @nodoc
const $AppleIdCredential = _$AppleIdCredentialTearOff();

/// @nodoc
mixin _$AppleIdCredential {
  /// An identifier associated with the authenticated user.
  ///
  /// This will always be provided on iOS and macOS systems. On Android, however, this will not be present.
  /// This will stay the same between sign ins, until the user deauthorizes your App.
  String? get userIdentifier => throw _privateConstructorUsedError;

  /// The users given name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only  the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  String? get givenName => throw _privateConstructorUsedError;

  /// The users family name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  String? get familyName => throw _privateConstructorUsedError;

  /// The users email in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.email] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  String? get email => throw _privateConstructorUsedError;

  /// The verification code for the current authorization.
  ///
  /// This code should be used by your server component to validate the authorization with Apple within 5 minutes upon receiving it.
  String get authorizationCode => throw _privateConstructorUsedError;

  /// A JSON Web Token (JWT) that securely communicates information about the user to your app.
  String? get identityToken => throw _privateConstructorUsedError;

  /// The `state` parameter that was passed to the request.
  ///
  /// This data is not modified by Apple.
  String? get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppleIdCredentialCopyWith<AppleIdCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleIdCredentialCopyWith<$Res> {
  factory $AppleIdCredentialCopyWith(
          AppleIdCredential value, $Res Function(AppleIdCredential) then) =
      _$AppleIdCredentialCopyWithImpl<$Res>;
  $Res call(
      {String? userIdentifier,
      String? givenName,
      String? familyName,
      String? email,
      String authorizationCode,
      String? identityToken,
      String? state});
}

/// @nodoc
class _$AppleIdCredentialCopyWithImpl<$Res>
    implements $AppleIdCredentialCopyWith<$Res> {
  _$AppleIdCredentialCopyWithImpl(this._value, this._then);

  final AppleIdCredential _value;
  // ignore: unused_field
  final $Res Function(AppleIdCredential) _then;

  @override
  $Res call({
    Object? userIdentifier = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? email = freezed,
    Object? authorizationCode = freezed,
    Object? identityToken = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      userIdentifier: userIdentifier == freezed
          ? _value.userIdentifier
          : userIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: givenName == freezed
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: authorizationCode == freezed
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
      identityToken: identityToken == freezed
          ? _value.identityToken
          : identityToken // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AppleIdCredentialCopyWith<$Res>
    implements $AppleIdCredentialCopyWith<$Res> {
  factory _$AppleIdCredentialCopyWith(
          _AppleIdCredential value, $Res Function(_AppleIdCredential) then) =
      __$AppleIdCredentialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userIdentifier,
      String? givenName,
      String? familyName,
      String? email,
      String authorizationCode,
      String? identityToken,
      String? state});
}

/// @nodoc
class __$AppleIdCredentialCopyWithImpl<$Res>
    extends _$AppleIdCredentialCopyWithImpl<$Res>
    implements _$AppleIdCredentialCopyWith<$Res> {
  __$AppleIdCredentialCopyWithImpl(
      _AppleIdCredential _value, $Res Function(_AppleIdCredential) _then)
      : super(_value, (v) => _then(v as _AppleIdCredential));

  @override
  _AppleIdCredential get _value => super._value as _AppleIdCredential;

  @override
  $Res call({
    Object? userIdentifier = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? email = freezed,
    Object? authorizationCode = freezed,
    Object? identityToken = freezed,
    Object? state = freezed,
  }) {
    return _then(_AppleIdCredential(
      userIdentifier: userIdentifier == freezed
          ? _value.userIdentifier
          : userIdentifier // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: givenName == freezed
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: familyName == freezed
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationCode: authorizationCode == freezed
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
      identityToken: identityToken == freezed
          ? _value.identityToken
          : identityToken // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppleIdCredential implements _AppleIdCredential {
  _$_AppleIdCredential(
      {this.userIdentifier,
      this.givenName,
      this.familyName,
      this.email,
      required this.authorizationCode,
      this.identityToken,
      this.state});

  factory _$_AppleIdCredential.fromJson(Map<String, dynamic> json) =>
      _$$_AppleIdCredentialFromJson(json);

  @override

  /// An identifier associated with the authenticated user.
  ///
  /// This will always be provided on iOS and macOS systems. On Android, however, this will not be present.
  /// This will stay the same between sign ins, until the user deauthorizes your App.
  final String? userIdentifier;
  @override

  /// The users given name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only  the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  final String? givenName;
  @override

  /// The users family name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  final String? familyName;
  @override

  /// The users email in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.email] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  final String? email;
  @override

  /// The verification code for the current authorization.
  ///
  /// This code should be used by your server component to validate the authorization with Apple within 5 minutes upon receiving it.
  final String authorizationCode;
  @override

  /// A JSON Web Token (JWT) that securely communicates information about the user to your app.
  final String? identityToken;
  @override

  /// The `state` parameter that was passed to the request.
  ///
  /// This data is not modified by Apple.
  final String? state;

  @override
  String toString() {
    return 'AppleIdCredential(userIdentifier: $userIdentifier, givenName: $givenName, familyName: $familyName, email: $email, authorizationCode: $authorizationCode, identityToken: $identityToken, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppleIdCredential &&
            (identical(other.userIdentifier, userIdentifier) ||
                other.userIdentifier == userIdentifier) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode) &&
            (identical(other.identityToken, identityToken) ||
                other.identityToken == identityToken) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userIdentifier, givenName,
      familyName, email, authorizationCode, identityToken, state);

  @JsonKey(ignore: true)
  @override
  _$AppleIdCredentialCopyWith<_AppleIdCredential> get copyWith =>
      __$AppleIdCredentialCopyWithImpl<_AppleIdCredential>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppleIdCredentialToJson(this);
  }
}

abstract class _AppleIdCredential implements AppleIdCredential {
  factory _AppleIdCredential(
      {String? userIdentifier,
      String? givenName,
      String? familyName,
      String? email,
      required String authorizationCode,
      String? identityToken,
      String? state}) = _$_AppleIdCredential;

  factory _AppleIdCredential.fromJson(Map<String, dynamic> json) =
      _$_AppleIdCredential.fromJson;

  @override

  /// An identifier associated with the authenticated user.
  ///
  /// This will always be provided on iOS and macOS systems. On Android, however, this will not be present.
  /// This will stay the same between sign ins, until the user deauthorizes your App.
  String? get userIdentifier;
  @override

  /// The users given name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only  the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  String? get givenName;
  @override

  /// The users family name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  String? get familyName;
  @override

  /// The users email in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.email] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  String? get email;
  @override

  /// The verification code for the current authorization.
  ///
  /// This code should be used by your server component to validate the authorization with Apple within 5 minutes upon receiving it.
  String get authorizationCode;
  @override

  /// A JSON Web Token (JWT) that securely communicates information about the user to your app.
  String? get identityToken;
  @override

  /// The `state` parameter that was passed to the request.
  ///
  /// This data is not modified by Apple.
  String? get state;
  @override
  @JsonKey(ignore: true)
  _$AppleIdCredentialCopyWith<_AppleIdCredential> get copyWith =>
      throw _privateConstructorUsedError;
}
