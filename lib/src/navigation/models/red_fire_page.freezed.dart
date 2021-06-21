// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'red_fire_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RedFirePage _$RedFirePageFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'initial':
      return RedFireInitialPage.fromJson(json);
    case 'problem':
      return RedFireProblemPage.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$RedFirePageTearOff {
  const _$RedFirePageTearOff();

  RedFireInitialPage initial() {
    return const RedFireInitialPage();
  }

  RedFireProblemPage problem(ProblemInfo info) {
    return RedFireProblemPage(
      info,
    );
  }

  RedFirePage fromJson(Map<String, Object> json) {
    return RedFirePage.fromJson(json);
  }
}

/// @nodoc
const $RedFirePage = _$RedFirePageTearOff();

/// @nodoc
mixin _$RedFirePage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ProblemInfo info) problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ProblemInfo info)? problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RedFireInitialPage value) initial,
    required TResult Function(RedFireProblemPage value) problem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RedFireInitialPage value)? initial,
    TResult Function(RedFireProblemPage value)? problem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedFirePageCopyWith<$Res> {
  factory $RedFirePageCopyWith(
          RedFirePage value, $Res Function(RedFirePage) then) =
      _$RedFirePageCopyWithImpl<$Res>;
}

/// @nodoc
class _$RedFirePageCopyWithImpl<$Res> implements $RedFirePageCopyWith<$Res> {
  _$RedFirePageCopyWithImpl(this._value, this._then);

  final RedFirePage _value;
  // ignore: unused_field
  final $Res Function(RedFirePage) _then;
}

/// @nodoc
abstract class $RedFireInitialPageCopyWith<$Res> {
  factory $RedFireInitialPageCopyWith(
          RedFireInitialPage value, $Res Function(RedFireInitialPage) then) =
      _$RedFireInitialPageCopyWithImpl<$Res>;
}

/// @nodoc
class _$RedFireInitialPageCopyWithImpl<$Res>
    extends _$RedFirePageCopyWithImpl<$Res>
    implements $RedFireInitialPageCopyWith<$Res> {
  _$RedFireInitialPageCopyWithImpl(
      RedFireInitialPage _value, $Res Function(RedFireInitialPage) _then)
      : super(_value, (v) => _then(v as RedFireInitialPage));

  @override
  RedFireInitialPage get _value => super._value as RedFireInitialPage;
}

/// @nodoc
@JsonSerializable()
class _$RedFireInitialPage implements RedFireInitialPage {
  const _$RedFireInitialPage();

  factory _$RedFireInitialPage.fromJson(Map<String, dynamic> json) =>
      _$_$RedFireInitialPageFromJson(json);

  @override
  String toString() {
    return 'RedFirePage.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RedFireInitialPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ProblemInfo info) problem,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ProblemInfo info)? problem,
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
    required TResult Function(RedFireInitialPage value) initial,
    required TResult Function(RedFireProblemPage value) problem,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RedFireInitialPage value)? initial,
    TResult Function(RedFireProblemPage value)? problem,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$RedFireInitialPageToJson(this)..['runtimeType'] = 'initial';
  }
}

abstract class RedFireInitialPage implements RedFirePage {
  const factory RedFireInitialPage() = _$RedFireInitialPage;

  factory RedFireInitialPage.fromJson(Map<String, dynamic> json) =
      _$RedFireInitialPage.fromJson;
}

/// @nodoc
abstract class $RedFireProblemPageCopyWith<$Res> {
  factory $RedFireProblemPageCopyWith(
          RedFireProblemPage value, $Res Function(RedFireProblemPage) then) =
      _$RedFireProblemPageCopyWithImpl<$Res>;
  $Res call({ProblemInfo info});

  $ProblemInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$RedFireProblemPageCopyWithImpl<$Res>
    extends _$RedFirePageCopyWithImpl<$Res>
    implements $RedFireProblemPageCopyWith<$Res> {
  _$RedFireProblemPageCopyWithImpl(
      RedFireProblemPage _value, $Res Function(RedFireProblemPage) _then)
      : super(_value, (v) => _then(v as RedFireProblemPage));

  @override
  RedFireProblemPage get _value => super._value as RedFireProblemPage;

  @override
  $Res call({
    Object? info = freezed,
  }) {
    return _then(RedFireProblemPage(
      info == freezed
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
@JsonSerializable()
class _$RedFireProblemPage implements RedFireProblemPage {
  const _$RedFireProblemPage(this.info);

  factory _$RedFireProblemPage.fromJson(Map<String, dynamic> json) =>
      _$_$RedFireProblemPageFromJson(json);

  @override
  final ProblemInfo info;

  @override
  String toString() {
    return 'RedFirePage.problem(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RedFireProblemPage &&
            (identical(other.info, info) ||
                const DeepCollectionEquality().equals(other.info, info)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(info);

  @JsonKey(ignore: true)
  @override
  $RedFireProblemPageCopyWith<RedFireProblemPage> get copyWith =>
      _$RedFireProblemPageCopyWithImpl<RedFireProblemPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ProblemInfo info) problem,
  }) {
    return problem(info);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ProblemInfo info)? problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(info);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RedFireInitialPage value) initial,
    required TResult Function(RedFireProblemPage value) problem,
  }) {
    return problem(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RedFireInitialPage value)? initial,
    TResult Function(RedFireProblemPage value)? problem,
    required TResult orElse(),
  }) {
    if (problem != null) {
      return problem(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$RedFireProblemPageToJson(this)..['runtimeType'] = 'problem';
  }
}

abstract class RedFireProblemPage implements RedFirePage {
  const factory RedFireProblemPage(ProblemInfo info) = _$RedFireProblemPage;

  factory RedFireProblemPage.fromJson(Map<String, dynamic> json) =
      _$RedFireProblemPage.fromJson;

  ProblemInfo get info => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RedFireProblemPageCopyWith<RedFireProblemPage> get copyWith =>
      throw _privateConstructorUsedError;
}
