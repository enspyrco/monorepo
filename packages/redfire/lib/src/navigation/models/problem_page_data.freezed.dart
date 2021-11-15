// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProblemPageData _$ProblemPageDataFromJson(Map<String, dynamic> json) {
  return _ProblemPageData.fromJson(json);
}

/// @nodoc
class _$ProblemPageDataTearOff {
  const _$ProblemPageDataTearOff();

  _ProblemPageData call(ProblemInfo problem) {
    return _ProblemPageData(
      problem,
    );
  }

  ProblemPageData fromJson(Map<String, Object?> json) {
    return ProblemPageData.fromJson(json);
  }
}

/// @nodoc
const $ProblemPageData = _$ProblemPageDataTearOff();

/// @nodoc
mixin _$ProblemPageData {
  ProblemInfo get problem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemPageDataCopyWith<ProblemPageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemPageDataCopyWith<$Res> {
  factory $ProblemPageDataCopyWith(
          ProblemPageData value, $Res Function(ProblemPageData) then) =
      _$ProblemPageDataCopyWithImpl<$Res>;
  $Res call({ProblemInfo problem});

  $ProblemInfoCopyWith<$Res> get problem;
}

/// @nodoc
class _$ProblemPageDataCopyWithImpl<$Res>
    implements $ProblemPageDataCopyWith<$Res> {
  _$ProblemPageDataCopyWithImpl(this._value, this._then);

  final ProblemPageData _value;
  // ignore: unused_field
  final $Res Function(ProblemPageData) _then;

  @override
  $Res call({
    Object? problem = freezed,
  }) {
    return _then(_value.copyWith(
      problem: problem == freezed
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as ProblemInfo,
    ));
  }

  @override
  $ProblemInfoCopyWith<$Res> get problem {
    return $ProblemInfoCopyWith<$Res>(_value.problem, (value) {
      return _then(_value.copyWith(problem: value));
    });
  }
}

/// @nodoc
abstract class _$ProblemPageDataCopyWith<$Res>
    implements $ProblemPageDataCopyWith<$Res> {
  factory _$ProblemPageDataCopyWith(
          _ProblemPageData value, $Res Function(_ProblemPageData) then) =
      __$ProblemPageDataCopyWithImpl<$Res>;
  @override
  $Res call({ProblemInfo problem});

  @override
  $ProblemInfoCopyWith<$Res> get problem;
}

/// @nodoc
class __$ProblemPageDataCopyWithImpl<$Res>
    extends _$ProblemPageDataCopyWithImpl<$Res>
    implements _$ProblemPageDataCopyWith<$Res> {
  __$ProblemPageDataCopyWithImpl(
      _ProblemPageData _value, $Res Function(_ProblemPageData) _then)
      : super(_value, (v) => _then(v as _ProblemPageData));

  @override
  _ProblemPageData get _value => super._value as _ProblemPageData;

  @override
  $Res call({
    Object? problem = freezed,
  }) {
    return _then(_ProblemPageData(
      problem == freezed
          ? _value.problem
          : problem // ignore: cast_nullable_to_non_nullable
              as ProblemInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProblemPageData extends _ProblemPageData {
  const _$_ProblemPageData(this.problem) : super._();

  factory _$_ProblemPageData.fromJson(Map<String, dynamic> json) =>
      _$$_ProblemPageDataFromJson(json);

  @override
  final ProblemInfo problem;

  @override
  String toString() {
    return 'ProblemPageData(problem: $problem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProblemPageData &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, problem);

  @JsonKey(ignore: true)
  @override
  _$ProblemPageDataCopyWith<_ProblemPageData> get copyWith =>
      __$ProblemPageDataCopyWithImpl<_ProblemPageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProblemPageDataToJson(this);
  }
}

abstract class _ProblemPageData extends ProblemPageData {
  const factory _ProblemPageData(ProblemInfo problem) = _$_ProblemPageData;
  const _ProblemPageData._() : super._();

  factory _ProblemPageData.fromJson(Map<String, dynamic> json) =
      _$_ProblemPageData.fromJson;

  @override
  ProblemInfo get problem;
  @override
  @JsonKey(ignore: true)
  _$ProblemPageDataCopyWith<_ProblemPageData> get copyWith =>
      throw _privateConstructorUsedError;
}
