// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'present_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PresentSet _$PresentSetFromJson(Map<String, dynamic> json) {
  return _PresentSet.fromJson(json);
}

/// @nodoc
class _$PresentSetTearOff {
  const _$PresentSetTearOff();

  _PresentSet call({String type = 'present_set', required ISet<String> ids}) {
    return _PresentSet(
      type: type,
      ids: ids,
    );
  }

  PresentSet fromJson(Map<String, Object> json) {
    return PresentSet.fromJson(json);
  }
}

/// @nodoc
const $PresentSet = _$PresentSetTearOff();

/// @nodoc
mixin _$PresentSet {
  String get type => throw _privateConstructorUsedError;
  ISet<String> get ids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresentSetCopyWith<PresentSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresentSetCopyWith<$Res> {
  factory $PresentSetCopyWith(
          PresentSet value, $Res Function(PresentSet) then) =
      _$PresentSetCopyWithImpl<$Res>;
  $Res call({String type, ISet<String> ids});
}

/// @nodoc
class _$PresentSetCopyWithImpl<$Res> implements $PresentSetCopyWith<$Res> {
  _$PresentSetCopyWithImpl(this._value, this._then);

  final PresentSet _value;
  // ignore: unused_field
  final $Res Function(PresentSet) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
    ));
  }
}

/// @nodoc
abstract class _$PresentSetCopyWith<$Res> implements $PresentSetCopyWith<$Res> {
  factory _$PresentSetCopyWith(
          _PresentSet value, $Res Function(_PresentSet) then) =
      __$PresentSetCopyWithImpl<$Res>;
  @override
  $Res call({String type, ISet<String> ids});
}

/// @nodoc
class __$PresentSetCopyWithImpl<$Res> extends _$PresentSetCopyWithImpl<$Res>
    implements _$PresentSetCopyWith<$Res> {
  __$PresentSetCopyWithImpl(
      _PresentSet _value, $Res Function(_PresentSet) _then)
      : super(_value, (v) => _then(v as _PresentSet));

  @override
  _PresentSet get _value => super._value as _PresentSet;

  @override
  $Res call({
    Object? type = freezed,
    Object? ids = freezed,
  }) {
    return _then(_PresentSet(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as ISet<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PresentSet implements _PresentSet {
  _$_PresentSet({this.type = 'present_set', required this.ids});

  factory _$_PresentSet.fromJson(Map<String, dynamic> json) =>
      _$$_PresentSetFromJson(json);

  @JsonKey(defaultValue: 'present_set')
  @override
  final String type;
  @override
  final ISet<String> ids;

  @override
  String toString() {
    return 'PresentSet(type: $type, ids: $ids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PresentSet &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.ids, ids) ||
                const DeepCollectionEquality().equals(other.ids, ids)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(ids);

  @JsonKey(ignore: true)
  @override
  _$PresentSetCopyWith<_PresentSet> get copyWith =>
      __$PresentSetCopyWithImpl<_PresentSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PresentSetToJson(this);
  }
}

abstract class _PresentSet implements PresentSet {
  factory _PresentSet({String type, required ISet<String> ids}) = _$_PresentSet;

  factory _PresentSet.fromJson(Map<String, dynamic> json) =
      _$_PresentSet.fromJson;

  @override
  String get type => throw _privateConstructorUsedError;
  @override
  ISet<String> get ids => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PresentSetCopyWith<_PresentSet> get copyWith =>
      throw _privateConstructorUsedError;
}
