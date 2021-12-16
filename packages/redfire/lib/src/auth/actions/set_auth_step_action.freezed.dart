// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'set_auth_step_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetAuthStepAction _$SetAuthStepActionFromJson(Map<String, dynamic> json) {
  return _SetAuthStepAction.fromJson(json);
}

/// @nodoc
class _$SetAuthStepActionTearOff {
  const _$SetAuthStepActionTearOff();

  _SetAuthStepAction call(AuthStepEnum step) {
    return _SetAuthStepAction(
      step,
    );
  }

  SetAuthStepAction fromJson(Map<String, Object?> json) {
    return SetAuthStepAction.fromJson(json);
  }
}

/// @nodoc
const $SetAuthStepAction = _$SetAuthStepActionTearOff();

/// @nodoc
mixin _$SetAuthStepAction {
  AuthStepEnum get step => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetAuthStepActionCopyWith<SetAuthStepAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetAuthStepActionCopyWith<$Res> {
  factory $SetAuthStepActionCopyWith(
          SetAuthStepAction value, $Res Function(SetAuthStepAction) then) =
      _$SetAuthStepActionCopyWithImpl<$Res>;
  $Res call({AuthStepEnum step});
}

/// @nodoc
class _$SetAuthStepActionCopyWithImpl<$Res>
    implements $SetAuthStepActionCopyWith<$Res> {
  _$SetAuthStepActionCopyWithImpl(this._value, this._then);

  final SetAuthStepAction _value;
  // ignore: unused_field
  final $Res Function(SetAuthStepAction) _then;

  @override
  $Res call({
    Object? step = freezed,
  }) {
    return _then(_value.copyWith(
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthStepEnum,
    ));
  }
}

/// @nodoc
abstract class _$SetAuthStepActionCopyWith<$Res>
    implements $SetAuthStepActionCopyWith<$Res> {
  factory _$SetAuthStepActionCopyWith(
          _SetAuthStepAction value, $Res Function(_SetAuthStepAction) then) =
      __$SetAuthStepActionCopyWithImpl<$Res>;
  @override
  $Res call({AuthStepEnum step});
}

/// @nodoc
class __$SetAuthStepActionCopyWithImpl<$Res>
    extends _$SetAuthStepActionCopyWithImpl<$Res>
    implements _$SetAuthStepActionCopyWith<$Res> {
  __$SetAuthStepActionCopyWithImpl(
      _SetAuthStepAction _value, $Res Function(_SetAuthStepAction) _then)
      : super(_value, (v) => _then(v as _SetAuthStepAction));

  @override
  _SetAuthStepAction get _value => super._value as _SetAuthStepAction;

  @override
  $Res call({
    Object? step = freezed,
  }) {
    return _then(_SetAuthStepAction(
      step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthStepEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SetAuthStepAction extends _SetAuthStepAction {
  const _$_SetAuthStepAction(this.step) : super._();

  factory _$_SetAuthStepAction.fromJson(Map<String, dynamic> json) =>
      _$$_SetAuthStepActionFromJson(json);

  @override
  final AuthStepEnum step;

  @override
  String toString() {
    return 'SetAuthStepAction(step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetAuthStepAction &&
            const DeepCollectionEquality().equals(other.step, step));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(step));

  @JsonKey(ignore: true)
  @override
  _$SetAuthStepActionCopyWith<_SetAuthStepAction> get copyWith =>
      __$SetAuthStepActionCopyWithImpl<_SetAuthStepAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetAuthStepActionToJson(this);
  }
}

abstract class _SetAuthStepAction extends SetAuthStepAction {
  const factory _SetAuthStepAction(AuthStepEnum step) = _$_SetAuthStepAction;
  const _SetAuthStepAction._() : super._();

  factory _SetAuthStepAction.fromJson(Map<String, dynamic> json) =
      _$_SetAuthStepAction.fromJson;

  @override
  AuthStepEnum get step;
  @override
  @JsonKey(ignore: true)
  _$SetAuthStepActionCopyWith<_SetAuthStepAction> get copyWith =>
      throw _privateConstructorUsedError;
}
