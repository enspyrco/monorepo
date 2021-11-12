// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'launch_url_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LaunchUrlAction _$LaunchUrlActionFromJson(Map<String, dynamic> json) {
  return _LaunchUrlAction.fromJson(json);
}

/// @nodoc
class _$LaunchUrlActionTearOff {
  const _$LaunchUrlActionTearOff();

  _LaunchUrlAction call({required String url}) {
    return _LaunchUrlAction(
      url: url,
    );
  }

  LaunchUrlAction fromJson(Map<String, Object?> json) {
    return LaunchUrlAction.fromJson(json);
  }
}

/// @nodoc
const $LaunchUrlAction = _$LaunchUrlActionTearOff();

/// @nodoc
mixin _$LaunchUrlAction {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LaunchUrlActionCopyWith<LaunchUrlAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchUrlActionCopyWith<$Res> {
  factory $LaunchUrlActionCopyWith(
          LaunchUrlAction value, $Res Function(LaunchUrlAction) then) =
      _$LaunchUrlActionCopyWithImpl<$Res>;
  $Res call({String url});
}

/// @nodoc
class _$LaunchUrlActionCopyWithImpl<$Res>
    implements $LaunchUrlActionCopyWith<$Res> {
  _$LaunchUrlActionCopyWithImpl(this._value, this._then);

  final LaunchUrlAction _value;
  // ignore: unused_field
  final $Res Function(LaunchUrlAction) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LaunchUrlActionCopyWith<$Res>
    implements $LaunchUrlActionCopyWith<$Res> {
  factory _$LaunchUrlActionCopyWith(
          _LaunchUrlAction value, $Res Function(_LaunchUrlAction) then) =
      __$LaunchUrlActionCopyWithImpl<$Res>;
  @override
  $Res call({String url});
}

/// @nodoc
class __$LaunchUrlActionCopyWithImpl<$Res>
    extends _$LaunchUrlActionCopyWithImpl<$Res>
    implements _$LaunchUrlActionCopyWith<$Res> {
  __$LaunchUrlActionCopyWithImpl(
      _LaunchUrlAction _value, $Res Function(_LaunchUrlAction) _then)
      : super(_value, (v) => _then(v as _LaunchUrlAction));

  @override
  _LaunchUrlAction get _value => super._value as _LaunchUrlAction;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_LaunchUrlAction(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LaunchUrlAction extends _LaunchUrlAction {
  _$_LaunchUrlAction({required this.url}) : super._();

  factory _$_LaunchUrlAction.fromJson(Map<String, dynamic> json) =>
      _$$_LaunchUrlActionFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'LaunchUrlAction(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LaunchUrlAction &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  _$LaunchUrlActionCopyWith<_LaunchUrlAction> get copyWith =>
      __$LaunchUrlActionCopyWithImpl<_LaunchUrlAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LaunchUrlActionToJson(this);
  }
}

abstract class _LaunchUrlAction extends LaunchUrlAction {
  factory _LaunchUrlAction({required String url}) = _$_LaunchUrlAction;
  _LaunchUrlAction._() : super._();

  factory _LaunchUrlAction.fromJson(Map<String, dynamic> json) =
      _$_LaunchUrlAction.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$LaunchUrlActionCopyWith<_LaunchUrlAction> get copyWith =>
      throw _privateConstructorUsedError;
}
