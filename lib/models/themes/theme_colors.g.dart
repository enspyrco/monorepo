// GENERATED CODE - DO NOT MODIFY BY HAND

part of theme_colors;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ThemeColors> _$themeColorsSerializer = new _$ThemeColorsSerializer();

class _$ThemeColorsSerializer implements StructuredSerializer<ThemeColors> {
  @override
  final Iterable<Type> types = const [ThemeColors, _$ThemeColors];
  @override
  final String wireName = 'ThemeColors';

  @override
  Iterable<Object?> serialize(Serializers serializers, ThemeColors object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'primary',
      serializers.serialize(object.primary, specifiedType: const FullType(int)),
      'secondary',
      serializers.serialize(object.secondary,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ThemeColors deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThemeColorsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'primary':
          result.primary = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'secondary':
          result.secondary = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemeColors extends ThemeColors {
  @override
  final int primary;
  @override
  final int secondary;
  @override
  final int? error;

  factory _$ThemeColors([void Function(ThemeColorsBuilder)? updates]) =>
      (new ThemeColorsBuilder()..update(updates)).build();

  _$ThemeColors._({required this.primary, required this.secondary, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(primary, 'ThemeColors', 'primary');
    BuiltValueNullFieldError.checkNotNull(
        secondary, 'ThemeColors', 'secondary');
  }

  @override
  ThemeColors rebuild(void Function(ThemeColorsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeColorsBuilder toBuilder() => new ThemeColorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeColors &&
        primary == other.primary &&
        secondary == other.secondary &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, primary.hashCode), secondary.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ThemeColors')
          ..add('primary', primary)
          ..add('secondary', secondary)
          ..add('error', error))
        .toString();
  }
}

class ThemeColorsBuilder implements Builder<ThemeColors, ThemeColorsBuilder> {
  _$ThemeColors? _$v;

  int? _primary;
  int? get primary => _$this._primary;
  set primary(int? primary) => _$this._primary = primary;

  int? _secondary;
  int? get secondary => _$this._secondary;
  set secondary(int? secondary) => _$this._secondary = secondary;

  int? _error;
  int? get error => _$this._error;
  set error(int? error) => _$this._error = error;

  ThemeColorsBuilder();

  ThemeColorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _primary = $v.primary;
      _secondary = $v.secondary;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemeColors other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemeColors;
  }

  @override
  void update(void Function(ThemeColorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ThemeColors build() {
    final _$result = _$v ??
        new _$ThemeColors._(
            primary: BuiltValueNullFieldError.checkNotNull(
                primary, 'ThemeColors', 'primary'),
            secondary: BuiltValueNullFieldError.checkNotNull(
                secondary, 'ThemeColors', 'secondary'),
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
