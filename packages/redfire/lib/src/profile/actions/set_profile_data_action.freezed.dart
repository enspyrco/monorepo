// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_profile_data_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetProfileDataAction _$SetProfileDataActionFromJson(Map<String, dynamic> json) {
  return _SetProfileDataAction.fromJson(json);
}

/// @nodoc
class _$SetProfileDataActionTearOff {
  const _$SetProfileDataActionTearOff();

  _SetProfileDataAction call({required ProfileData data}) {
    return _SetProfileDataAction(
      data: data,
    );
  }

  SetProfileDataAction fromJson(Map<String, Object?> json) {
    return SetProfileDataAction.fromJson(json);
  }
}

/// @nodoc
const $SetProfileDataAction = _$SetProfileDataActionTearOff();

/// @nodoc
mixin _$SetProfileDataAction {
  ProfileData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetProfileDataActionCopyWith<SetProfileDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetProfileDataActionCopyWith<$Res> {
  factory $SetProfileDataActionCopyWith(SetProfileDataAction value,
          $Res Function(SetProfileDataAction) then) =
      _$SetProfileDataActionCopyWithImpl<$Res>;
  $Res call({ProfileData data});

  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class _$SetProfileDataActionCopyWithImpl<$Res>
    implements $SetProfileDataActionCopyWith<$Res> {
  _$SetProfileDataActionCopyWithImpl(this._value, this._then);

  final SetProfileDataAction _value;
  // ignore: unused_field
  final $Res Function(SetProfileDataAction) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileData,
    ));
  }

  @override
  $ProfileDataCopyWith<$Res> get data {
    return $ProfileDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$SetProfileDataActionCopyWith<$Res>
    implements $SetProfileDataActionCopyWith<$Res> {
  factory _$SetProfileDataActionCopyWith(_SetProfileDataAction value,
          $Res Function(_SetProfileDataAction) then) =
      __$SetProfileDataActionCopyWithImpl<$Res>;
  @override
  $Res call({ProfileData data});

  @override
  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class __$SetProfileDataActionCopyWithImpl<$Res>
    extends _$SetProfileDataActionCopyWithImpl<$Res>
    implements _$SetProfileDataActionCopyWith<$Res> {
  __$SetProfileDataActionCopyWithImpl(
      _SetProfileDataAction _value, $Res Function(_SetProfileDataAction) _then)
      : super(_value, (v) => _then(v as _SetProfileDataAction));

  @override
  _SetProfileDataAction get _value => super._value as _SetProfileDataAction;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_SetProfileDataAction(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetProfileDataAction extends _SetProfileDataAction {
  const _$_SetProfileDataAction({required this.data}) : super._();

  factory _$_SetProfileDataAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetProfileDataActionFromJson(json);

  @override
  final ProfileData data;

  @override
  String toString() {
    return 'SetProfileDataAction(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetProfileDataAction &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$SetProfileDataActionCopyWith<_SetProfileDataAction> get copyWith =>
      __$SetProfileDataActionCopyWithImpl<_SetProfileDataAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetProfileDataActionToJson(this);
  }
}

abstract class _SetProfileDataAction extends SetProfileDataAction {
  const factory _SetProfileDataAction({required ProfileData data}) =
      _$_SetProfileDataAction;
  const _SetProfileDataAction._() : super._();

  factory _SetProfileDataAction.fromJson(Map<String, dynamic> json) =
      _$_SetProfileDataAction.fromJson;

  @override
  ProfileData get data;
  @override
  @JsonKey(ignore: true)
  _$SetProfileDataActionCopyWith<_SetProfileDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}
