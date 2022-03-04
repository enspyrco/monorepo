// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_id_token_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetIdTokenAction _$GetIdTokenActionFromJson(Map<String, dynamic> json) {
  return _GetIdTokenAction.fromJson(json);
}

/// @nodoc
class _$GetIdTokenActionTearOff {
  const _$GetIdTokenActionTearOff();

  _GetIdTokenAction call() {
    return const _GetIdTokenAction();
  }

  GetIdTokenAction fromJson(Map<String, Object?> json) {
    return GetIdTokenAction.fromJson(json);
  }
}

/// @nodoc
const $GetIdTokenAction = _$GetIdTokenActionTearOff();

/// @nodoc
mixin _$GetIdTokenAction {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetIdTokenActionCopyWith<$Res> {
  factory $GetIdTokenActionCopyWith(
          GetIdTokenAction value, $Res Function(GetIdTokenAction) then) =
      _$GetIdTokenActionCopyWithImpl<$Res>;
}

/// @nodoc
class _$GetIdTokenActionCopyWithImpl<$Res>
    implements $GetIdTokenActionCopyWith<$Res> {
  _$GetIdTokenActionCopyWithImpl(this._value, this._then);

  final GetIdTokenAction _value;
  // ignore: unused_field
  final $Res Function(GetIdTokenAction) _then;
}

/// @nodoc
abstract class _$GetIdTokenActionCopyWith<$Res> {
  factory _$GetIdTokenActionCopyWith(
          _GetIdTokenAction value, $Res Function(_GetIdTokenAction) then) =
      __$GetIdTokenActionCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetIdTokenActionCopyWithImpl<$Res>
    extends _$GetIdTokenActionCopyWithImpl<$Res>
    implements _$GetIdTokenActionCopyWith<$Res> {
  __$GetIdTokenActionCopyWithImpl(
      _GetIdTokenAction _value, $Res Function(_GetIdTokenAction) _then)
      : super(_value, (v) => _then(v as _GetIdTokenAction));

  @override
  _GetIdTokenAction get _value => super._value as _GetIdTokenAction;
}

/// @nodoc
@JsonSerializable()
class _$_GetIdTokenAction extends _GetIdTokenAction {
  const _$_GetIdTokenAction() : super._();

  factory _$_GetIdTokenAction.fromJson(Map<String, dynamic> json) =>
      _$$_GetIdTokenActionFromJson(json);

  @override
  String toString() {
    return 'GetIdTokenAction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetIdTokenAction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetIdTokenActionToJson(this);
  }
}

abstract class _GetIdTokenAction extends GetIdTokenAction {
  const factory _GetIdTokenAction() = _$_GetIdTokenAction;
  const _GetIdTokenAction._() : super._();

  factory _GetIdTokenAction.fromJson(Map<String, dynamic> json) =
      _$_GetIdTokenAction.fromJson;
}
