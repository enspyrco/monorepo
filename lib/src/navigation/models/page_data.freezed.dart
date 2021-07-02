// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PageData _$PageDataFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'initial':
      return InitialPageData.fromJson(json);
    case 'profile':
      return ProfilePageData.fromJson(json);
    case 'problem':
      return ProblemPageData.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$PageDataTearOff {
  const _$PageDataTearOff();

  InitialPageData initial() {
    return const InitialPageData();
  }

  ProfilePageData profile() {
    return const ProfilePageData();
  }

  ProblemPageData problem(ProblemInfo problem) {
    return ProblemPageData(
      problem,
    );
  }

  PageData fromJson(Map<String, Object> json) {
    return PageData.fromJson(json);
  }
}

/// @nodoc
const $PageData = _$PageDataTearOff();

/// @nodoc
mixin _$PageData {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profile,
    required TResult Function(ProblemInfo problem) problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profile,
    TResult Function(ProblemInfo problem)? problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPageData value) initial,
    required TResult Function(ProfilePageData value) profile,
    required TResult Function(ProblemPageData value) problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPageData value)? initial,
    TResult Function(ProfilePageData value)? profile,
    TResult Function(ProblemPageData value)? problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageDataCopyWith<$Res> {
  factory $PageDataCopyWith(PageData value, $Res Function(PageData) then) =
      _$PageDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$PageDataCopyWithImpl<$Res> implements $PageDataCopyWith<$Res> {
  _$PageDataCopyWithImpl(this._value, this._then);

  final PageData _value;
  // ignore: unused_field
  final $Res Function(PageData) _then;
}

/// @nodoc
abstract class $InitialPageDataCopyWith<$Res> {
  factory $InitialPageDataCopyWith(
          InitialPageData value, $Res Function(InitialPageData) then) =
      _$InitialPageDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialPageDataCopyWithImpl<$Res> extends _$PageDataCopyWithImpl<$Res>
    implements $InitialPageDataCopyWith<$Res> {
  _$InitialPageDataCopyWithImpl(
      InitialPageData _value, $Res Function(InitialPageData) _then)
      : super(_value, (v) => _then(v as InitialPageData));

  @override
  InitialPageData get _value => super._value as InitialPageData;
}

/// @nodoc
@JsonSerializable()
class _$InitialPageData implements InitialPageData {
  const _$InitialPageData();

  factory _$InitialPageData.fromJson(Map<String, dynamic> json) =>
      _$_$InitialPageDataFromJson(json);

  @override
  String toString() {
    return 'PageData.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialPageData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profile,
    required TResult Function(ProblemInfo problem) problem,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profile,
    TResult Function(ProblemInfo problem)? problem,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPageData value) initial,
    required TResult Function(ProfilePageData value) profile,
    required TResult Function(ProblemPageData value) problem,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPageData value)? initial,
    TResult Function(ProfilePageData value)? profile,
    TResult Function(ProblemPageData value)? problem,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$InitialPageDataToJson(this)..['runtimeType'] = 'initial';
  }
}

abstract class InitialPageData implements PageData {
  const factory InitialPageData() = _$InitialPageData;

  factory InitialPageData.fromJson(Map<String, dynamic> json) =
      _$InitialPageData.fromJson;
}

/// @nodoc
abstract class $ProfilePageDataCopyWith<$Res> {
  factory $ProfilePageDataCopyWith(
          ProfilePageData value, $Res Function(ProfilePageData) then) =
      _$ProfilePageDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfilePageDataCopyWithImpl<$Res> extends _$PageDataCopyWithImpl<$Res>
    implements $ProfilePageDataCopyWith<$Res> {
  _$ProfilePageDataCopyWithImpl(
      ProfilePageData _value, $Res Function(ProfilePageData) _then)
      : super(_value, (v) => _then(v as ProfilePageData));

  @override
  ProfilePageData get _value => super._value as ProfilePageData;
}

/// @nodoc
@JsonSerializable()
class _$ProfilePageData implements ProfilePageData {
  const _$ProfilePageData();

  factory _$ProfilePageData.fromJson(Map<String, dynamic> json) =>
      _$_$ProfilePageDataFromJson(json);

  @override
  String toString() {
    return 'PageData.profile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ProfilePageData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profile,
    required TResult Function(ProblemInfo problem) problem,
  }) {
    return profile();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profile,
    TResult Function(ProblemInfo problem)? problem,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPageData value) initial,
    required TResult Function(ProfilePageData value) profile,
    required TResult Function(ProblemPageData value) problem,
  }) {
    return profile(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPageData value)? initial,
    TResult Function(ProfilePageData value)? profile,
    TResult Function(ProblemPageData value)? problem,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$ProfilePageDataToJson(this)..['runtimeType'] = 'profile';
  }
}

abstract class ProfilePageData implements PageData {
  const factory ProfilePageData() = _$ProfilePageData;

  factory ProfilePageData.fromJson(Map<String, dynamic> json) =
      _$ProfilePageData.fromJson;
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
class _$ProblemPageDataCopyWithImpl<$Res> extends _$PageDataCopyWithImpl<$Res>
    implements $ProblemPageDataCopyWith<$Res> {
  _$ProblemPageDataCopyWithImpl(
      ProblemPageData _value, $Res Function(ProblemPageData) _then)
      : super(_value, (v) => _then(v as ProblemPageData));

  @override
  ProblemPageData get _value => super._value as ProblemPageData;

  @override
  $Res call({
    Object? problem = freezed,
  }) {
    return _then(ProblemPageData(
      problem == freezed
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
@JsonSerializable()
class _$ProblemPageData implements ProblemPageData {
  const _$ProblemPageData(this.problem);

  factory _$ProblemPageData.fromJson(Map<String, dynamic> json) =>
      _$_$ProblemPageDataFromJson(json);

  @override
  final ProblemInfo problem;

  @override
  String toString() {
    return 'PageData.problem(problem: $problem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProblemPageData &&
            (identical(other.problem, problem) ||
                const DeepCollectionEquality().equals(other.problem, problem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(problem);

  @JsonKey(ignore: true)
  @override
  $ProblemPageDataCopyWith<ProblemPageData> get copyWith =>
      _$ProblemPageDataCopyWithImpl<ProblemPageData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profile,
    required TResult Function(ProblemInfo problem) problem,
  }) {
    return problem(this.problem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profile,
    TResult Function(ProblemInfo problem)? problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(this.problem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialPageData value) initial,
    required TResult Function(ProfilePageData value) profile,
    required TResult Function(ProblemPageData value) problem,
  }) {
    return problem(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialPageData value)? initial,
    TResult Function(ProfilePageData value)? profile,
    TResult Function(ProblemPageData value)? problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$ProblemPageDataToJson(this)..['runtimeType'] = 'problem';
  }
}

abstract class ProblemPageData implements PageData {
  const factory ProblemPageData(ProblemInfo problem) = _$ProblemPageData;

  factory ProblemPageData.fromJson(Map<String, dynamic> json) =
      _$ProblemPageData.fromJson;

  ProblemInfo get problem => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProblemPageDataCopyWith<ProblemPageData> get copyWith =>
      throw _privateConstructorUsedError;
}
