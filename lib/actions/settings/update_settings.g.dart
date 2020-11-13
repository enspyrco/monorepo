// GENERATED CODE - DO NOT MODIFY BY HAND

part of update_settings;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UpdateSettings> _$updateSettingsSerializer =
    new _$UpdateSettingsSerializer();

class _$UpdateSettingsSerializer
    implements StructuredSerializer<UpdateSettings> {
  @override
  final Iterable<Type> types = const [UpdateSettings, _$UpdateSettings];
  @override
  final String wireName = 'UpdateSettings';

  @override
  Iterable<Object> serialize(Serializers serializers, UpdateSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'platform',
      serializers.serialize(object.platform,
          specifiedType: const FullType(PlatformEnum)),
    ];

    return result;
  }

  @override
  UpdateSettings deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UpdateSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'platform':
          result.platform = serializers.deserialize(value,
              specifiedType: const FullType(PlatformEnum)) as PlatformEnum;
          break;
      }
    }

    return result.build();
  }
}

class _$UpdateSettings extends UpdateSettings {
  @override
  final PlatformEnum platform;

  factory _$UpdateSettings([void Function(UpdateSettingsBuilder) updates]) =>
      (new UpdateSettingsBuilder()..update(updates)).build();

  _$UpdateSettings._({this.platform}) : super._() {
    if (platform == null) {
      throw new BuiltValueNullFieldError('UpdateSettings', 'platform');
    }
  }

  @override
  UpdateSettings rebuild(void Function(UpdateSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateSettingsBuilder toBuilder() =>
      new UpdateSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateSettings && platform == other.platform;
  }

  @override
  int get hashCode {
    return $jf($jc(0, platform.hashCode));
  }
}

class UpdateSettingsBuilder
    implements Builder<UpdateSettings, UpdateSettingsBuilder> {
  _$UpdateSettings _$v;

  PlatformEnum _platform;
  PlatformEnum get platform => _$this._platform;
  set platform(PlatformEnum platform) => _$this._platform = platform;

  UpdateSettingsBuilder();

  UpdateSettingsBuilder get _$this {
    if (_$v != null) {
      _platform = _$v.platform;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateSettings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UpdateSettings;
  }

  @override
  void update(void Function(UpdateSettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UpdateSettings build() {
    final _$result = _$v ?? new _$UpdateSettings._(platform: platform);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
