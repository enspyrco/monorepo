// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthUserData _$AuthUserDataFromJson(Map<String, dynamic> json) {
  return _AuthUserData.fromJson(json);
}

/// @nodoc
class _$AuthUserDataTearOff {
  const _$AuthUserDataTearOff();

  _AuthUserData call(
      {required String uid,
      String? tenantId,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber,
      DateTime? createdOn,
      DateTime? lastSignedInOn,
      required bool isAnonymous,
      required bool emailVerified,
      required IList<AuthProviderData> providers}) {
    return _AuthUserData(
      uid: uid,
      tenantId: tenantId,
      displayName: displayName,
      photoURL: photoURL,
      email: email,
      phoneNumber: phoneNumber,
      createdOn: createdOn,
      lastSignedInOn: lastSignedInOn,
      isAnonymous: isAnonymous,
      emailVerified: emailVerified,
      providers: providers,
    );
  }

  AuthUserData fromJson(Map<String, Object> json) {
    return AuthUserData.fromJson(json);
  }
}

/// @nodoc
const $AuthUserData = _$AuthUserDataTearOff();

/// @nodoc
mixin _$AuthUserData {
  String get uid => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;
  DateTime? get lastSignedInOn => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  IList<AuthProviderData> get providers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthUserDataCopyWith<AuthUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserDataCopyWith<$Res> {
  factory $AuthUserDataCopyWith(
          AuthUserData value, $Res Function(AuthUserData) then) =
      _$AuthUserDataCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String? tenantId,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber,
      DateTime? createdOn,
      DateTime? lastSignedInOn,
      bool isAnonymous,
      bool emailVerified,
      IList<AuthProviderData> providers});
}

/// @nodoc
class _$AuthUserDataCopyWithImpl<$Res> implements $AuthUserDataCopyWith<$Res> {
  _$AuthUserDataCopyWithImpl(this._value, this._then);

  final AuthUserData _value;
  // ignore: unused_field
  final $Res Function(AuthUserData) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? tenantId = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? createdOn = freezed,
    Object? lastSignedInOn = freezed,
    Object? isAnonymous = freezed,
    Object? emailVerified = freezed,
    Object? providers = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
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
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSignedInOn: lastSignedInOn == freezed
          ? _value.lastSignedInOn
          : lastSignedInOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAnonymous: isAnonymous == freezed
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      providers: providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as IList<AuthProviderData>,
    ));
  }
}

/// @nodoc
abstract class _$AuthUserDataCopyWith<$Res>
    implements $AuthUserDataCopyWith<$Res> {
  factory _$AuthUserDataCopyWith(
          _AuthUserData value, $Res Function(_AuthUserData) then) =
      __$AuthUserDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String? tenantId,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber,
      DateTime? createdOn,
      DateTime? lastSignedInOn,
      bool isAnonymous,
      bool emailVerified,
      IList<AuthProviderData> providers});
}

/// @nodoc
class __$AuthUserDataCopyWithImpl<$Res> extends _$AuthUserDataCopyWithImpl<$Res>
    implements _$AuthUserDataCopyWith<$Res> {
  __$AuthUserDataCopyWithImpl(
      _AuthUserData _value, $Res Function(_AuthUserData) _then)
      : super(_value, (v) => _then(v as _AuthUserData));

  @override
  _AuthUserData get _value => super._value as _AuthUserData;

  @override
  $Res call({
    Object? uid = freezed,
    Object? tenantId = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? createdOn = freezed,
    Object? lastSignedInOn = freezed,
    Object? isAnonymous = freezed,
    Object? emailVerified = freezed,
    Object? providers = freezed,
  }) {
    return _then(_AuthUserData(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
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
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSignedInOn: lastSignedInOn == freezed
          ? _value.lastSignedInOn
          : lastSignedInOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAnonymous: isAnonymous == freezed
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      providers: providers == freezed
          ? _value.providers
          : providers // ignore: cast_nullable_to_non_nullable
              as IList<AuthProviderData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthUserData extends _AuthUserData {
  _$_AuthUserData(
      {required this.uid,
      this.tenantId,
      this.displayName,
      this.photoURL,
      this.email,
      this.phoneNumber,
      this.createdOn,
      this.lastSignedInOn,
      required this.isAnonymous,
      required this.emailVerified,
      required this.providers})
      : super._();

  factory _$_AuthUserData.fromJson(Map<String, dynamic> json) =>
      _$$_AuthUserDataFromJson(json);

  @override
  final String uid;
  @override
  final String? tenantId;
  @override
  final String? displayName;
  @override
  final String? photoURL;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final DateTime? createdOn;
  @override
  final DateTime? lastSignedInOn;
  @override
  final bool isAnonymous;
  @override
  final bool emailVerified;
  @override
  final IList<AuthProviderData> providers;

  @override
  String toString() {
    return 'AuthUserData(uid: $uid, tenantId: $tenantId, displayName: $displayName, photoURL: $photoURL, email: $email, phoneNumber: $phoneNumber, createdOn: $createdOn, lastSignedInOn: $lastSignedInOn, isAnonymous: $isAnonymous, emailVerified: $emailVerified, providers: $providers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthUserData &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.tenantId, tenantId) ||
                const DeepCollectionEquality()
                    .equals(other.tenantId, tenantId)) &&
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
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.createdOn, createdOn) ||
                const DeepCollectionEquality()
                    .equals(other.createdOn, createdOn)) &&
            (identical(other.lastSignedInOn, lastSignedInOn) ||
                const DeepCollectionEquality()
                    .equals(other.lastSignedInOn, lastSignedInOn)) &&
            (identical(other.isAnonymous, isAnonymous) ||
                const DeepCollectionEquality()
                    .equals(other.isAnonymous, isAnonymous)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)) &&
            (identical(other.providers, providers) ||
                const DeepCollectionEquality()
                    .equals(other.providers, providers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(tenantId) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(photoURL) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(createdOn) ^
      const DeepCollectionEquality().hash(lastSignedInOn) ^
      const DeepCollectionEquality().hash(isAnonymous) ^
      const DeepCollectionEquality().hash(emailVerified) ^
      const DeepCollectionEquality().hash(providers);

  @JsonKey(ignore: true)
  @override
  _$AuthUserDataCopyWith<_AuthUserData> get copyWith =>
      __$AuthUserDataCopyWithImpl<_AuthUserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthUserDataToJson(this);
  }
}

abstract class _AuthUserData extends AuthUserData {
  factory _AuthUserData(
      {required String uid,
      String? tenantId,
      String? displayName,
      String? photoURL,
      String? email,
      String? phoneNumber,
      DateTime? createdOn,
      DateTime? lastSignedInOn,
      required bool isAnonymous,
      required bool emailVerified,
      required IList<AuthProviderData> providers}) = _$_AuthUserData;
  _AuthUserData._() : super._();

  factory _AuthUserData.fromJson(Map<String, dynamic> json) =
      _$_AuthUserData.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String? get tenantId => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get photoURL => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  DateTime? get createdOn => throw _privateConstructorUsedError;
  @override
  DateTime? get lastSignedInOn => throw _privateConstructorUsedError;
  @override
  bool get isAnonymous => throw _privateConstructorUsedError;
  @override
  bool get emailVerified => throw _privateConstructorUsedError;
  @override
  IList<AuthProviderData> get providers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthUserDataCopyWith<_AuthUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
