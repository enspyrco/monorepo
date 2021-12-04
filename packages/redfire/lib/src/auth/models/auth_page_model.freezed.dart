// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthPageModel _$AuthPageModelFromJson(Map<String, dynamic> json) {
  return _AuthPageVM.fromJson(json);
}

/// @nodoc
class _$AuthPageModelTearOff {
  const _$AuthPageModelTearOff();

  _AuthPageVM call(PlatformsEnum platform, AuthState auth) {
    return _AuthPageVM(
      platform,
      auth,
    );
  }

  AuthPageModel fromJson(Map<String, Object?> json) {
    return AuthPageModel.fromJson(json);
  }
}

/// @nodoc
const $AuthPageModel = _$AuthPageModelTearOff();

/// @nodoc
mixin _$AuthPageModel {
  PlatformsEnum get platform => throw _privateConstructorUsedError;
  AuthState get auth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthPageModelCopyWith<AuthPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthPageModelCopyWith<$Res> {
  factory $AuthPageModelCopyWith(
          AuthPageModel value, $Res Function(AuthPageModel) then) =
      _$AuthPageModelCopyWithImpl<$Res>;
  $Res call({PlatformsEnum platform, AuthState auth});

  $AuthStateCopyWith<$Res> get auth;
}

/// @nodoc
class _$AuthPageModelCopyWithImpl<$Res>
    implements $AuthPageModelCopyWith<$Res> {
  _$AuthPageModelCopyWithImpl(this._value, this._then);

  final AuthPageModel _value;
  // ignore: unused_field
  final $Res Function(AuthPageModel) _then;

  @override
  $Res call({
    Object? platform = freezed,
    Object? auth = freezed,
  }) {
    return _then(_value.copyWith(
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformsEnum,
      auth: auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthState,
    ));
  }

  @override
  $AuthStateCopyWith<$Res> get auth {
    return $AuthStateCopyWith<$Res>(_value.auth, (value) {
      return _then(_value.copyWith(auth: value));
    });
  }
}

/// @nodoc
abstract class _$AuthPageVMCopyWith<$Res>
    implements $AuthPageModelCopyWith<$Res> {
  factory _$AuthPageVMCopyWith(
          _AuthPageVM value, $Res Function(_AuthPageVM) then) =
      __$AuthPageVMCopyWithImpl<$Res>;
  @override
  $Res call({PlatformsEnum platform, AuthState auth});

  @override
  $AuthStateCopyWith<$Res> get auth;
}

/// @nodoc
class __$AuthPageVMCopyWithImpl<$Res> extends _$AuthPageModelCopyWithImpl<$Res>
    implements _$AuthPageVMCopyWith<$Res> {
  __$AuthPageVMCopyWithImpl(
      _AuthPageVM _value, $Res Function(_AuthPageVM) _then)
      : super(_value, (v) => _then(v as _AuthPageVM));

  @override
  _AuthPageVM get _value => super._value as _AuthPageVM;

  @override
  $Res call({
    Object? platform = freezed,
    Object? auth = freezed,
  }) {
    return _then(_AuthPageVM(
      platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformsEnum,
      auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthPageVM extends _AuthPageVM {
  _$_AuthPageVM(this.platform, this.auth) : super._();

  factory _$_AuthPageVM.fromJson(Map<String, dynamic> json) =>
      _$$_AuthPageVMFromJson(json);

  @override
  final PlatformsEnum platform;
  @override
  final AuthState auth;

  @override
  String toString() {
    return 'AuthPageModel(platform: $platform, auth: $auth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthPageVM &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.auth, auth) || other.auth == auth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platform, auth);

  @JsonKey(ignore: true)
  @override
  _$AuthPageVMCopyWith<_AuthPageVM> get copyWith =>
      __$AuthPageVMCopyWithImpl<_AuthPageVM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthPageVMToJson(this);
  }
}

abstract class _AuthPageVM extends AuthPageModel {
  factory _AuthPageVM(PlatformsEnum platform, AuthState auth) = _$_AuthPageVM;
  _AuthPageVM._() : super._();

  factory _AuthPageVM.fromJson(Map<String, dynamic> json) =
      _$_AuthPageVM.fromJson;

  @override
  PlatformsEnum get platform;
  @override
  AuthState get auth;
  @override
  @JsonKey(ignore: true)
  _$AuthPageVMCopyWith<_AuthPageVM> get copyWith =>
      throw _privateConstructorUsedError;
}
