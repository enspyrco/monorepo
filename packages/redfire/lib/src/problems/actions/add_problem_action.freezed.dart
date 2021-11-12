// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_problem_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddProblemAction _$AddProblemActionFromJson(Map<String, dynamic> json) {
  return _AddProblemAction.fromJson(json);
}

/// @nodoc
class _$AddProblemActionTearOff {
  const _$AddProblemActionTearOff();

  _AddProblemAction call(ProblemInfo info) {
    return _AddProblemAction(
      info,
    );
  }

  AddProblemAction fromJson(Map<String, Object?> json) {
    return AddProblemAction.fromJson(json);
  }
}

/// @nodoc
const $AddProblemAction = _$AddProblemActionTearOff();

/// @nodoc
mixin _$AddProblemAction {
  ProblemInfo get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddProblemActionCopyWith<AddProblemAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProblemActionCopyWith<$Res> {
  factory $AddProblemActionCopyWith(
          AddProblemAction value, $Res Function(AddProblemAction) then) =
      _$AddProblemActionCopyWithImpl<$Res>;
  $Res call({ProblemInfo info});

  $ProblemInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$AddProblemActionCopyWithImpl<$Res>
    implements $AddProblemActionCopyWith<$Res> {
  _$AddProblemActionCopyWithImpl(this._value, this._then);

  final AddProblemAction _value;
  // ignore: unused_field
  final $Res Function(AddProblemAction) _then;

  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ProblemInfo,
    ));
  }

  @override
  $ProblemInfoCopyWith<$Res> get info {
    return $ProblemInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc
abstract class _$AddProblemActionCopyWith<$Res>
    implements $AddProblemActionCopyWith<$Res> {
  factory _$AddProblemActionCopyWith(
          _AddProblemAction value, $Res Function(_AddProblemAction) then) =
      __$AddProblemActionCopyWithImpl<$Res>;
  @override
  $Res call({ProblemInfo info});

  @override
  $ProblemInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$AddProblemActionCopyWithImpl<$Res>
    extends _$AddProblemActionCopyWithImpl<$Res>
    implements _$AddProblemActionCopyWith<$Res> {
  __$AddProblemActionCopyWithImpl(
      _AddProblemAction _value, $Res Function(_AddProblemAction) _then)
      : super(_value, (v) => _then(v as _AddProblemAction));

  @override
  _AddProblemAction get _value => super._value as _AddProblemAction;

  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_AddProblemAction(
      info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ProblemInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddProblemAction extends _AddProblemAction {
  _$_AddProblemAction(this.info) : super._();

  factory _$_AddProblemAction.fromJson(Map<String, dynamic> json) =>
      _$$_AddProblemActionFromJson(json);

  @override
  final ProblemInfo info;

  @override
  String toString() {
    return 'AddProblemAction(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddProblemAction &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  _$AddProblemActionCopyWith<_AddProblemAction> get copyWith =>
      __$AddProblemActionCopyWithImpl<_AddProblemAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddProblemActionToJson(this);
  }
}

abstract class _AddProblemAction extends AddProblemAction {
  factory _AddProblemAction(ProblemInfo info) = _$_AddProblemAction;
  _AddProblemAction._() : super._();

  factory _AddProblemAction.fromJson(Map<String, dynamic> json) =
      _$_AddProblemAction.fromJson;

  @override
  ProblemInfo get info;
  @override
  @JsonKey(ignore: true)
  _$AddProblemActionCopyWith<_AddProblemAction> get copyWith =>
      throw _privateConstructorUsedError;
}
