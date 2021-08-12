// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'observe_auth_state_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ObserveAuthStateAction _$ObserveAuthStateActionFromJson(
    Map<String, dynamic> json) {
  return _ObserveAuthStateAction.fromJson(json);
}

/// @nodoc
class _$ObserveAuthStateActionTearOff {
  const _$ObserveAuthStateActionTearOff();

  _ObserveAuthStateAction call() {
    return _ObserveAuthStateAction();
  }

  ObserveAuthStateAction fromJson(Map<String, Object> json) {
    return ObserveAuthStateAction.fromJson(json);
  }
}

/// @nodoc
const $ObserveAuthStateAction = _$ObserveAuthStateActionTearOff();

/// @nodoc
mixin _$ObserveAuthStateAction {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObserveAuthStateActionCopyWith<$Res> {
  factory $ObserveAuthStateActionCopyWith(ObserveAuthStateAction value,
          $Res Function(ObserveAuthStateAction) then) =
      _$ObserveAuthStateActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$ObserveAuthStateActionCopyWithImpl<$Res>
    implements $ObserveAuthStateActionCopyWith<$Res> {
  _$ObserveAuthStateActionCopyWithImpl(this._value, this._then);

  final ObserveAuthStateAction _value;
  // ignore: unused_field
  final $Res Function(ObserveAuthStateAction) _then;
}

/// @nodoc
abstract class _$ObserveAuthStateActionCopyWith<$Res> {
  factory _$ObserveAuthStateActionCopyWith(_ObserveAuthStateAction value,
          $Res Function(_ObserveAuthStateAction) then) =
      __$ObserveAuthStateActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$ObserveAuthStateActionCopyWithImpl<$Res>
    extends _$ObserveAuthStateActionCopyWithImpl<$Res>
    implements _$ObserveAuthStateActionCopyWith<$Res> {
  __$ObserveAuthStateActionCopyWithImpl(_ObserveAuthStateAction _value,
      $Res Function(_ObserveAuthStateAction) _then)
      : super(_value, (v) => _then(v as _ObserveAuthStateAction));

  @override
  _ObserveAuthStateAction get _value => super._value as _ObserveAuthStateAction;
}

/// @nodoc
@JsonSerializable()
class _$_ObserveAuthStateAction implements _ObserveAuthStateAction {
  _$_ObserveAuthStateAction();

  factory _$_ObserveAuthStateAction.fromJson(Map<String, dynamic> json) =>
      _$$_ObserveAuthStateActionFromJson(json);

  @override
  String toString() {
    return 'ObserveAuthStateAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ObserveAuthStateAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ObserveAuthStateActionToJson(this);
  }
}

abstract class _ObserveAuthStateAction implements ObserveAuthStateAction {
  factory _ObserveAuthStateAction() = _$_ObserveAuthStateAction;

  factory _ObserveAuthStateAction.fromJson(Map<String, dynamic> json) =
      _$_ObserveAuthStateAction.fromJson;
}
