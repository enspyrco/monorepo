// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProblemInfo _$ProblemInfoFromJson(Map<String, dynamic> json) {
  return _ProblemInfo.fromJson(json);
}

/// @nodoc
class _$ProblemInfoTearOff {
  const _$ProblemInfoTearOff();

  _ProblemInfo call(String message, [String? trace]) {
    return _ProblemInfo(
      message,
      trace,
    );
  }

  ProblemInfo fromJson(Map<String, Object> json) {
    return ProblemInfo.fromJson(json);
  }
}

/// @nodoc
const $ProblemInfo = _$ProblemInfoTearOff();

/// @nodoc
mixin _$ProblemInfo {
  String get message => throw _privateConstructorUsedError;
  String? get trace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemInfoCopyWith<ProblemInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemInfoCopyWith<$Res> {
  factory $ProblemInfoCopyWith(
          ProblemInfo value, $Res Function(ProblemInfo) then) =
      _$ProblemInfoCopyWithImpl<$Res>;
  $Res call({String message, String? trace});
}

/// @nodoc
class _$ProblemInfoCopyWithImpl<$Res> implements $ProblemInfoCopyWith<$Res> {
  _$ProblemInfoCopyWithImpl(this._value, this._then);

  final ProblemInfo _value;
  // ignore: unused_field
  final $Res Function(ProblemInfo) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? trace = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trace: trace == freezed
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProblemInfoCopyWith<$Res>
    implements $ProblemInfoCopyWith<$Res> {
  factory _$ProblemInfoCopyWith(
          _ProblemInfo value, $Res Function(_ProblemInfo) then) =
      __$ProblemInfoCopyWithImpl<$Res>;
  @override
  $Res call({String message, String? trace});
}

/// @nodoc
class __$ProblemInfoCopyWithImpl<$Res> extends _$ProblemInfoCopyWithImpl<$Res>
    implements _$ProblemInfoCopyWith<$Res> {
  __$ProblemInfoCopyWithImpl(
      _ProblemInfo _value, $Res Function(_ProblemInfo) _then)
      : super(_value, (v) => _then(v as _ProblemInfo));

  @override
  _ProblemInfo get _value => super._value as _ProblemInfo;

  @override
  $Res call({
    Object? message = freezed,
    Object? trace = freezed,
  }) {
    return _then(_ProblemInfo(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      trace == freezed
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProblemInfo implements _ProblemInfo {
  _$_ProblemInfo(this.message, [this.trace]);

  factory _$_ProblemInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ProblemInfoFromJson(json);

  @override
  final String message;
  @override
  final String? trace;

  @override
  String toString() {
    return 'ProblemInfo(message: $message, trace: $trace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProblemInfo &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.trace, trace) ||
                const DeepCollectionEquality().equals(other.trace, trace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(trace);

  @JsonKey(ignore: true)
  @override
  _$ProblemInfoCopyWith<_ProblemInfo> get copyWith =>
      __$ProblemInfoCopyWithImpl<_ProblemInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProblemInfoToJson(this);
  }
}

abstract class _ProblemInfo implements ProblemInfo {
  factory _ProblemInfo(String message, [String? trace]) = _$_ProblemInfo;

  factory _ProblemInfo.fromJson(Map<String, dynamic> json) =
      _$_ProblemInfo.fromJson;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String? get trace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProblemInfoCopyWith<_ProblemInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
