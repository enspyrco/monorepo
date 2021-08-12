// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_provider_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthProviderData _$AuthProviderDataFromJson(Map<String, dynamic> json) {
  return _AuthProviderData.fromJson(json);
}

/// @nodoc
class _$AuthProviderDataTearOff {
  const _$AuthProviderDataTearOff();

  _AuthProviderData call(
      {required String providerId,
      required String? uid,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber}) {
    return _AuthProviderData(
      providerId: providerId,
      uid: uid,
      displayName: displayName,
      photoURL: photoURL,
      email: email,
      phoneNumber: phoneNumber,
    );
  }

  AuthProviderData fromJson(Map<String, Object> json) {
    return AuthProviderData.fromJson(json);
  }
}

/// @nodoc
const $AuthProviderData = _$AuthProviderDataTearOff();

/// @nodoc
mixin _$AuthProviderData {
  /// The provider identifier.
  String get providerId => throw _privateConstructorUsedError;

  /// The provider’s user ID for the user.
  String? get uid => throw _privateConstructorUsedError;

  /// The name of the user.
  String? get displayName => throw _privateConstructorUsedError;

  /// The URL of the user’s profile photo.
  String? get photoURL => throw _privateConstructorUsedError;

  /// The user’s email address.
  String? get email => throw _privateConstructorUsedError;

  /// The user's phone number.
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthProviderDataCopyWith<AuthProviderData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProviderDataCopyWith<$Res> {
  factory $AuthProviderDataCopyWith(
          AuthProviderData value, $Res Function(AuthProviderData) then) =
      _$AuthProviderDataCopyWithImpl<$Res>;
  $Res call(
      {String providerId,
      String? uid,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber});
}

/// @nodoc
class _$AuthProviderDataCopyWithImpl<$Res>
    implements $AuthProviderDataCopyWith<$Res> {
  _$AuthProviderDataCopyWithImpl(this._value, this._then);

  final AuthProviderData _value;
  // ignore: unused_field
  final $Res Function(AuthProviderData) _then;

  @override
  $Res call({
    Object? providerId = freezed,
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      providerId: providerId == freezed
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthProviderDataCopyWith<$Res>
    implements $AuthProviderDataCopyWith<$Res> {
  factory _$AuthProviderDataCopyWith(
          _AuthProviderData value, $Res Function(_AuthProviderData) then) =
      __$AuthProviderDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String providerId,
      String? uid,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber});
}

/// @nodoc
class __$AuthProviderDataCopyWithImpl<$Res>
    extends _$AuthProviderDataCopyWithImpl<$Res>
    implements _$AuthProviderDataCopyWith<$Res> {
  __$AuthProviderDataCopyWithImpl(
      _AuthProviderData _value, $Res Function(_AuthProviderData) _then)
      : super(_value, (v) => _then(v as _AuthProviderData));

  @override
  _AuthProviderData get _value => super._value as _AuthProviderData;

  @override
  $Res call({
    Object? providerId = freezed,
    Object? uid = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_AuthProviderData(
      providerId: providerId == freezed
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthProviderData implements _AuthProviderData {
  _$_AuthProviderData(
      {required this.providerId,
      required this.uid,
      this.displayName,
      this.photoURL,
      this.email,
      this.phoneNumber});

  factory _$_AuthProviderData.fromJson(Map<String, dynamic> json) =>
      _$$_AuthProviderDataFromJson(json);

  @override

  /// The provider identifier.
  final String providerId;
  @override

  /// The provider’s user ID for the user.
  final String? uid;
  @override

  /// The name of the user.
  final String? displayName;
  @override

  /// The URL of the user’s profile photo.
  final String? photoURL;
  @override

  /// The user’s email address.
  final String? email;
  @override

  /// The user's phone number.
  final String? phoneNumber;

  @override
  String toString() {
    return 'AuthProviderData(providerId: $providerId, uid: $uid, displayName: $displayName, photoURL: $photoURL, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthProviderData &&
            (identical(other.providerId, providerId) ||
                const DeepCollectionEquality()
                    .equals(other.providerId, providerId)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.photoURL, photoURL) ||
                const DeepCollectionEquality()
                    .equals(other.photoURL, photoURL)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(providerId) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(photoURL) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber);

  @JsonKey(ignore: true)
  @override
  _$AuthProviderDataCopyWith<_AuthProviderData> get copyWith =>
      __$AuthProviderDataCopyWithImpl<_AuthProviderData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthProviderDataToJson(this);
  }
}

abstract class _AuthProviderData implements AuthProviderData {
  factory _AuthProviderData(
      {required String providerId,
      required String? uid,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber}) = _$_AuthProviderData;

  factory _AuthProviderData.fromJson(Map<String, dynamic> json) =
      _$_AuthProviderData.fromJson;

  @override

  /// The provider identifier.
  String get providerId => throw _privateConstructorUsedError;
  @override

  /// The provider’s user ID for the user.
  String? get uid => throw _privateConstructorUsedError;
  @override

  /// The name of the user.
  String? get displayName => throw _privateConstructorUsedError;
  @override

  /// The URL of the user’s profile photo.
  String? get photoURL => throw _privateConstructorUsedError;
  @override

  /// The user’s email address.
  String? get email => throw _privateConstructorUsedError;
  @override

  /// The user's phone number.
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthProviderDataCopyWith<_AuthProviderData> get copyWith =>
      throw _privateConstructorUsedError;
}
