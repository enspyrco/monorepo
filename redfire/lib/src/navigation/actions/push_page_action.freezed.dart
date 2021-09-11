// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'push_page_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PushPageAction _$PushPageActionFromJson(Map<String, dynamic> json) {
  return _PushPageAction.fromJson(json);
}

/// @nodoc
class _$PushPageActionTearOff {
  const _$PushPageActionTearOff();

  _PushPageAction call(@PageDataConverter() PageData page) {
    return _PushPageAction(
      page,
    );
  }

  PushPageAction fromJson(Map<String, Object> json) {
    return PushPageAction.fromJson(json);
  }
}

/// @nodoc
const $PushPageAction = _$PushPageActionTearOff();

/// @nodoc
mixin _$PushPageAction {
  @PageDataConverter()
  PageData get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushPageActionCopyWith<PushPageAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushPageActionCopyWith<$Res> {
  factory $PushPageActionCopyWith(
          PushPageAction value, $Res Function(PushPageAction) then) =
      _$PushPageActionCopyWithImpl<$Res>;
  $Res call({@PageDataConverter() PageData page});
}

/// @nodoc
class _$PushPageActionCopyWithImpl<$Res>
    implements $PushPageActionCopyWith<$Res> {
  _$PushPageActionCopyWithImpl(this._value, this._then);

  final PushPageAction _value;
  // ignore: unused_field
  final $Res Function(PushPageAction) _then;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PageData,
    ));
  }
}

/// @nodoc
abstract class _$PushPageActionCopyWith<$Res>
    implements $PushPageActionCopyWith<$Res> {
  factory _$PushPageActionCopyWith(
          _PushPageAction value, $Res Function(_PushPageAction) then) =
      __$PushPageActionCopyWithImpl<$Res>;
  @override
  $Res call({@PageDataConverter() PageData page});
}

/// @nodoc
class __$PushPageActionCopyWithImpl<$Res>
    extends _$PushPageActionCopyWithImpl<$Res>
    implements _$PushPageActionCopyWith<$Res> {
  __$PushPageActionCopyWithImpl(
      _PushPageAction _value, $Res Function(_PushPageAction) _then)
      : super(_value, (v) => _then(v as _PushPageAction));

  @override
  _PushPageAction get _value => super._value as _PushPageAction;

  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_PushPageAction(
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as PageData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushPageAction implements _PushPageAction {
  const _$_PushPageAction(@PageDataConverter() this.page);

  factory _$_PushPageAction.fromJson(Map<String, dynamic> json) =>
      _$$_PushPageActionFromJson(json);

  @override
  @PageDataConverter()
  final PageData page;

  @override
  String toString() {
    return 'PushPageAction(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PushPageAction &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @JsonKey(ignore: true)
  @override
  _$PushPageActionCopyWith<_PushPageAction> get copyWith =>
      __$PushPageActionCopyWithImpl<_PushPageAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushPageActionToJson(this);
  }
}

abstract class _PushPageAction implements PushPageAction {
  const factory _PushPageAction(@PageDataConverter() PageData page) =
      _$_PushPageAction;

  factory _PushPageAction.fromJson(Map<String, dynamic> json) =
      _$_PushPageAction.fromJson;

  @override
  @PageDataConverter()
  PageData get page => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PushPageActionCopyWith<_PushPageAction> get copyWith =>
      throw _privateConstructorUsedError;
}
