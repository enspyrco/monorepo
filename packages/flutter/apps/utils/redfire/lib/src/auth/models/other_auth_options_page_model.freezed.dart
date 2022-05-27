// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'other_auth_options_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OtherAuthOptionsPageModel _$OtherAuthOptionsPageModelFromJson(
    Map<String, dynamic> json) {
  return _OtherAuthOptionsPageModel.fromJson(json);
}

/// @nodoc
class _$OtherAuthOptionsPageModelTearOff {
  const _$OtherAuthOptionsPageModelTearOff();

  _OtherAuthOptionsPageModel call(AuthState auth) {
    return _OtherAuthOptionsPageModel(
      auth,
    );
  }

  OtherAuthOptionsPageModel fromJson(Map<String, Object?> json) {
    return OtherAuthOptionsPageModel.fromJson(json);
  }
}

/// @nodoc
const $OtherAuthOptionsPageModel = _$OtherAuthOptionsPageModelTearOff();

/// @nodoc
mixin _$OtherAuthOptionsPageModel {
  AuthState get auth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtherAuthOptionsPageModelCopyWith<OtherAuthOptionsPageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherAuthOptionsPageModelCopyWith<$Res> {
  factory $OtherAuthOptionsPageModelCopyWith(OtherAuthOptionsPageModel value,
          $Res Function(OtherAuthOptionsPageModel) then) =
      _$OtherAuthOptionsPageModelCopyWithImpl<$Res>;
  $Res call({AuthState auth});

  $AuthStateCopyWith<$Res> get auth;
}

/// @nodoc
class _$OtherAuthOptionsPageModelCopyWithImpl<$Res>
    implements $OtherAuthOptionsPageModelCopyWith<$Res> {
  _$OtherAuthOptionsPageModelCopyWithImpl(this._value, this._then);

  final OtherAuthOptionsPageModel _value;
  // ignore: unused_field
  final $Res Function(OtherAuthOptionsPageModel) _then;

  @override
  $Res call({
    Object? auth = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$OtherAuthOptionsPageModelCopyWith<$Res>
    implements $OtherAuthOptionsPageModelCopyWith<$Res> {
  factory _$OtherAuthOptionsPageModelCopyWith(_OtherAuthOptionsPageModel value,
          $Res Function(_OtherAuthOptionsPageModel) then) =
      __$OtherAuthOptionsPageModelCopyWithImpl<$Res>;
  @override
  $Res call({AuthState auth});

  @override
  $AuthStateCopyWith<$Res> get auth;
}

/// @nodoc
class __$OtherAuthOptionsPageModelCopyWithImpl<$Res>
    extends _$OtherAuthOptionsPageModelCopyWithImpl<$Res>
    implements _$OtherAuthOptionsPageModelCopyWith<$Res> {
  __$OtherAuthOptionsPageModelCopyWithImpl(_OtherAuthOptionsPageModel _value,
      $Res Function(_OtherAuthOptionsPageModel) _then)
      : super(_value, (v) => _then(v as _OtherAuthOptionsPageModel));

  @override
  _OtherAuthOptionsPageModel get _value =>
      super._value as _OtherAuthOptionsPageModel;

  @override
  $Res call({
    Object? auth = freezed,
  }) {
    return _then(_OtherAuthOptionsPageModel(
      auth == freezed
          ? _value.auth
          : auth // ignore: cast_nullable_to_non_nullable
              as AuthState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OtherAuthOptionsPageModel extends _OtherAuthOptionsPageModel {
  const _$_OtherAuthOptionsPageModel(this.auth) : super._();

  factory _$_OtherAuthOptionsPageModel.fromJson(Map<String, dynamic> json) =>
      _$$_OtherAuthOptionsPageModelFromJson(json);

  @override
  final AuthState auth;

  @override
  String toString() {
    return 'OtherAuthOptionsPageModel(auth: $auth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OtherAuthOptionsPageModel &&
            const DeepCollectionEquality().equals(other.auth, auth));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(auth));

  @JsonKey(ignore: true)
  @override
  _$OtherAuthOptionsPageModelCopyWith<_OtherAuthOptionsPageModel>
      get copyWith =>
          __$OtherAuthOptionsPageModelCopyWithImpl<_OtherAuthOptionsPageModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OtherAuthOptionsPageModelToJson(this);
  }
}

abstract class _OtherAuthOptionsPageModel extends OtherAuthOptionsPageModel {
  const factory _OtherAuthOptionsPageModel(AuthState auth) =
      _$_OtherAuthOptionsPageModel;
  const _OtherAuthOptionsPageModel._() : super._();

  factory _OtherAuthOptionsPageModel.fromJson(Map<String, dynamic> json) =
      _$_OtherAuthOptionsPageModel.fromJson;

  @override
  AuthState get auth;
  @override
  @JsonKey(ignore: true)
  _$OtherAuthOptionsPageModelCopyWith<_OtherAuthOptionsPageModel>
      get copyWith => throw _privateConstructorUsedError;
}
