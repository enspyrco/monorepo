// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'remove_problem_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoveProblemAction _$RemoveProblemActionFromJson(Map<String, dynamic> json) {
  return _RemoveProblemAction.fromJson(json);
}

/// @nodoc
class _$RemoveProblemActionTearOff {
  const _$RemoveProblemActionTearOff();

  _RemoveProblemAction call(ProblemInfo info) {
    return _RemoveProblemAction(
      info,
    );
  }

  RemoveProblemAction fromJson(Map<String, Object?> json) {
    return RemoveProblemAction.fromJson(json);
  }
}

/// @nodoc
const $RemoveProblemAction = _$RemoveProblemActionTearOff();

/// @nodoc
mixin _$RemoveProblemAction {
  ProblemInfo get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoveProblemActionCopyWith<RemoveProblemAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveProblemActionCopyWith<$Res> {
  factory $RemoveProblemActionCopyWith(
          RemoveProblemAction value, $Res Function(RemoveProblemAction) then) =
      _$RemoveProblemActionCopyWithImpl<$Res>;
  $Res call({ProblemInfo info});

  $ProblemInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$RemoveProblemActionCopyWithImpl<$Res>
    implements $RemoveProblemActionCopyWith<$Res> {
  _$RemoveProblemActionCopyWithImpl(this._value, this._then);

  final RemoveProblemAction _value;
  // ignore: unused_field
  final $Res Function(RemoveProblemAction) _then;

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
abstract class _$RemoveProblemActionCopyWith<$Res>
    implements $RemoveProblemActionCopyWith<$Res> {
  factory _$RemoveProblemActionCopyWith(_RemoveProblemAction value,
          $Res Function(_RemoveProblemAction) then) =
      __$RemoveProblemActionCopyWithImpl<$Res>;
  @override
  $Res call({ProblemInfo info});

  @override
  $ProblemInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$RemoveProblemActionCopyWithImpl<$Res>
    extends _$RemoveProblemActionCopyWithImpl<$Res>
    implements _$RemoveProblemActionCopyWith<$Res> {
  __$RemoveProblemActionCopyWithImpl(
      _RemoveProblemAction _value, $Res Function(_RemoveProblemAction) _then)
      : super(_value, (v) => _then(v as _RemoveProblemAction));

  @override
  _RemoveProblemAction get _value => super._value as _RemoveProblemAction;

  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(_RemoveProblemAction(
      info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as ProblemInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoveProblemAction implements _RemoveProblemAction {
  _$_RemoveProblemAction(this.info);

  factory _$_RemoveProblemAction.fromJson(Map<String, dynamic> json) =>
      _$$_RemoveProblemActionFromJson(json);

  @override
  final ProblemInfo info;

  @override
  String toString() {
    return 'RemoveProblemAction(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoveProblemAction &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  _$RemoveProblemActionCopyWith<_RemoveProblemAction> get copyWith =>
      __$RemoveProblemActionCopyWithImpl<_RemoveProblemAction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoveProblemActionToJson(this);
  }
}

abstract class _RemoveProblemAction implements RemoveProblemAction {
  factory _RemoveProblemAction(ProblemInfo info) = _$_RemoveProblemAction;

  factory _RemoveProblemAction.fromJson(Map<String, dynamic> json) =
      _$_RemoveProblemAction.fromJson;

  @override
  ProblemInfo get info;
  @override
  @JsonKey(ignore: true)
  _$RemoveProblemActionCopyWith<_RemoveProblemAction> get copyWith =>
      throw _privateConstructorUsedError;
}
