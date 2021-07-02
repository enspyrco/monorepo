// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store_auth_step_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreAuthStepAction _$StoreAuthStepActionFromJson(Map<String, dynamic> json) {
  return _StoreAuthStepAction.fromJson(json);
}

/// @nodoc
class _$StoreAuthStepActionTearOff {
  const _$StoreAuthStepActionTearOff();

  _StoreAuthStepAction call(AuthenticationEnum step) {
    return _StoreAuthStepAction(
      step,
    );
  }

  StoreAuthStepAction fromJson(Map<String, Object> json) {
    return StoreAuthStepAction.fromJson(json);
  }
}

/// @nodoc
const $StoreAuthStepAction = _$StoreAuthStepActionTearOff();

/// @nodoc
mixin _$StoreAuthStepAction {
  AuthenticationEnum get step => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreAuthStepActionCopyWith<StoreAuthStepAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreAuthStepActionCopyWith<$Res> {
  factory $StoreAuthStepActionCopyWith(
          StoreAuthStepAction value, $Res Function(StoreAuthStepAction) then) =
      _$StoreAuthStepActionCopyWithImpl<$Res>;
  $Res call({AuthenticationEnum step});
}

/// @nodoc
class _$StoreAuthStepActionCopyWithImpl<$Res>
    implements $StoreAuthStepActionCopyWith<$Res> {
  _$StoreAuthStepActionCopyWithImpl(this._value, this._then);

  final StoreAuthStepAction _value;
  // ignore: unused_field
  final $Res Function(StoreAuthStepAction) _then;

  @override
  $Res call({
    Object? step = freezed,
  }) {
    return _then(_value.copyWith(
      step: step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthenticationEnum,
    ));
  }
}

/// @nodoc
abstract class _$StoreAuthStepActionCopyWith<$Res>
    implements $StoreAuthStepActionCopyWith<$Res> {
  factory _$StoreAuthStepActionCopyWith(_StoreAuthStepAction value,
          $Res Function(_StoreAuthStepAction) then) =
      __$StoreAuthStepActionCopyWithImpl<$Res>;
  @override
  $Res call({AuthenticationEnum step});
}

/// @nodoc
class __$StoreAuthStepActionCopyWithImpl<$Res>
    extends _$StoreAuthStepActionCopyWithImpl<$Res>
    implements _$StoreAuthStepActionCopyWith<$Res> {
  __$StoreAuthStepActionCopyWithImpl(
      _StoreAuthStepAction _value, $Res Function(_StoreAuthStepAction) _then)
      : super(_value, (v) => _then(v as _StoreAuthStepAction));

  @override
  _StoreAuthStepAction get _value => super._value as _StoreAuthStepAction;

  @override
  $Res call({
    Object? step = freezed,
  }) {
    return _then(_StoreAuthStepAction(
      step == freezed
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as AuthenticationEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreAuthStepAction implements _StoreAuthStepAction {
  _$_StoreAuthStepAction(this.step);

  factory _$_StoreAuthStepAction.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreAuthStepActionFromJson(json);

  @override
  final AuthenticationEnum step;

  @override
  String toString() {
    return 'StoreAuthStepAction(step: $step)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreAuthStepAction &&
            (identical(other.step, step) ||
                const DeepCollectionEquality().equals(other.step, step)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(step);

  @JsonKey(ignore: true)
  @override
  _$StoreAuthStepActionCopyWith<_StoreAuthStepAction> get copyWith =>
      __$StoreAuthStepActionCopyWithImpl<_StoreAuthStepAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreAuthStepActionToJson(this);
  }
}

abstract class _StoreAuthStepAction implements StoreAuthStepAction {
  factory _StoreAuthStepAction(AuthenticationEnum step) =
      _$_StoreAuthStepAction;

  factory _StoreAuthStepAction.fromJson(Map<String, dynamic> json) =
      _$_StoreAuthStepAction.fromJson;

  @override
  AuthenticationEnum get step => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreAuthStepActionCopyWith<_StoreAuthStepAction> get copyWith =>
      throw _privateConstructorUsedError;
}
