// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'store_profile_data_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreProfileDataAction _$StoreProfileDataActionFromJson(
    Map<String, dynamic> json) {
  return _StoreProfileDataAction.fromJson(json);
}

/// @nodoc
class _$StoreProfileDataActionTearOff {
  const _$StoreProfileDataActionTearOff();

  _StoreProfileDataAction call({required ProfileData data}) {
    return _StoreProfileDataAction(
      data: data,
    );
  }

  StoreProfileDataAction fromJson(Map<String, Object> json) {
    return StoreProfileDataAction.fromJson(json);
  }
}

/// @nodoc
const $StoreProfileDataAction = _$StoreProfileDataActionTearOff();

/// @nodoc
mixin _$StoreProfileDataAction {
  ProfileData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreProfileDataActionCopyWith<StoreProfileDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreProfileDataActionCopyWith<$Res> {
  factory $StoreProfileDataActionCopyWith(StoreProfileDataAction value,
          $Res Function(StoreProfileDataAction) then) =
      _$StoreProfileDataActionCopyWithImpl<$Res>;
  $Res call({ProfileData data});

  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class _$StoreProfileDataActionCopyWithImpl<$Res>
    implements $StoreProfileDataActionCopyWith<$Res> {
  _$StoreProfileDataActionCopyWithImpl(this._value, this._then);

  final StoreProfileDataAction _value;
  // ignore: unused_field
  final $Res Function(StoreProfileDataAction) _then;

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
abstract class _$StoreProfileDataActionCopyWith<$Res>
    implements $StoreProfileDataActionCopyWith<$Res> {
  factory _$StoreProfileDataActionCopyWith(_StoreProfileDataAction value,
          $Res Function(_StoreProfileDataAction) then) =
      __$StoreProfileDataActionCopyWithImpl<$Res>;
  @override
  $Res call({ProfileData data});

  @override
  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class __$StoreProfileDataActionCopyWithImpl<$Res>
    extends _$StoreProfileDataActionCopyWithImpl<$Res>
    implements _$StoreProfileDataActionCopyWith<$Res> {
  __$StoreProfileDataActionCopyWithImpl(_StoreProfileDataAction _value,
      $Res Function(_StoreProfileDataAction) _then)
      : super(_value, (v) => _then(v as _StoreProfileDataAction));

  @override
  _StoreProfileDataAction get _value => super._value as _StoreProfileDataAction;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_StoreProfileDataAction(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreProfileDataAction implements _StoreProfileDataAction {
  _$_StoreProfileDataAction({required this.data});

  factory _$_StoreProfileDataAction.fromJson(Map<String, dynamic> json) =>
      _$$_StoreProfileDataActionFromJson(json);

  @override
  final ProfileData data;

  @override
  String toString() {
    return 'StoreProfileDataAction(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreProfileDataAction &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$StoreProfileDataActionCopyWith<_StoreProfileDataAction> get copyWith =>
      __$StoreProfileDataActionCopyWithImpl<_StoreProfileDataAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreProfileDataActionToJson(this);
  }
}

abstract class _StoreProfileDataAction implements StoreProfileDataAction {
  factory _StoreProfileDataAction({required ProfileData data}) =
      _$_StoreProfileDataAction;

  factory _StoreProfileDataAction.fromJson(Map<String, dynamic> json) =
      _$_StoreProfileDataAction.fromJson;

  @override
  ProfileData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreProfileDataActionCopyWith<_StoreProfileDataAction> get copyWith =>
      throw _privateConstructorUsedError;
}
