// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
class _$ProfileDataTearOff {
  const _$ProfileDataTearOff();

  _ProfileData call(
      {required String id,
      String? displayName,
      String? photoURL,
      String? firstName,
      String? lastName,
      required Map<ProvidersEnum, AuthorizationEnum> authorizationStatus}) {
    return _ProfileData(
      id: id,
      displayName: displayName,
      photoURL: photoURL,
      firstName: firstName,
      lastName: lastName,
      authorizationStatus: authorizationStatus,
    );
  }

  ProfileData fromJson(Map<String, Object?> json) {
    return ProfileData.fromJson(json);
  }
}

/// @nodoc
const $ProfileData = _$ProfileDataTearOff();

/// @nodoc
mixin _$ProfileData {
  String get id => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  Map<ProvidersEnum, AuthorizationEnum> get authorizationStatus =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) then) =
      _$ProfileDataCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? displayName,
      String? photoURL,
      String? firstName,
      String? lastName,
      Map<ProvidersEnum, AuthorizationEnum> authorizationStatus});
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res> implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  final ProfileData _value;
  // ignore: unused_field
  final $Res Function(ProfileData) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? authorizationStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationStatus: authorizationStatus == freezed
          ? _value.authorizationStatus
          : authorizationStatus // ignore: cast_nullable_to_non_nullable
              as Map<ProvidersEnum, AuthorizationEnum>,
    ));
  }
}

/// @nodoc
abstract class _$ProfileDataCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$ProfileDataCopyWith(
          _ProfileData value, $Res Function(_ProfileData) then) =
      __$ProfileDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? displayName,
      String? photoURL,
      String? firstName,
      String? lastName,
      Map<ProvidersEnum, AuthorizationEnum> authorizationStatus});
}

/// @nodoc
class __$ProfileDataCopyWithImpl<$Res> extends _$ProfileDataCopyWithImpl<$Res>
    implements _$ProfileDataCopyWith<$Res> {
  __$ProfileDataCopyWithImpl(
      _ProfileData _value, $Res Function(_ProfileData) _then)
      : super(_value, (v) => _then(v as _ProfileData));

  @override
  _ProfileData get _value => super._value as _ProfileData;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? authorizationStatus = freezed,
  }) {
    return _then(_ProfileData(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizationStatus: authorizationStatus == freezed
          ? _value.authorizationStatus
          : authorizationStatus // ignore: cast_nullable_to_non_nullable
              as Map<ProvidersEnum, AuthorizationEnum>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileData implements _ProfileData {
  _$_ProfileData(
      {required this.id,
      this.displayName,
      this.photoURL,
      this.firstName,
      this.lastName,
      required this.authorizationStatus});

  factory _$_ProfileData.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDataFromJson(json);

  @override
  final String id;
  @override
  final String? displayName;
  @override
  final String? photoURL;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final Map<ProvidersEnum, AuthorizationEnum> authorizationStatus;

  @override
  String toString() {
    return 'ProfileData(id: $id, displayName: $displayName, photoURL: $photoURL, firstName: $firstName, lastName: $lastName, authorizationStatus: $authorizationStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality()
                .equals(other.authorizationStatus, authorizationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      photoURL,
      firstName,
      lastName,
      const DeepCollectionEquality().hash(authorizationStatus));

  @JsonKey(ignore: true)
  @override
  _$ProfileDataCopyWith<_ProfileData> get copyWith =>
      __$ProfileDataCopyWithImpl<_ProfileData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDataToJson(this);
  }
}

abstract class _ProfileData implements ProfileData {
  factory _ProfileData(
          {required String id,
          String? displayName,
          String? photoURL,
          String? firstName,
          String? lastName,
          required Map<ProvidersEnum, AuthorizationEnum> authorizationStatus}) =
      _$_ProfileData;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$_ProfileData.fromJson;

  @override
  String get id;
  @override
  String? get displayName;
  @override
  String? get photoURL;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  Map<ProvidersEnum, AuthorizationEnum> get authorizationStatus;
  @override
  @JsonKey(ignore: true)
  _$ProfileDataCopyWith<_ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}
