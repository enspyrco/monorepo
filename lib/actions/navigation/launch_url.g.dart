// GENERATED CODE - DO NOT MODIFY BY HAND

part of launch_url;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LaunchURL> _$launchURLSerializer = new _$LaunchURLSerializer();

class _$LaunchURLSerializer implements StructuredSerializer<LaunchURL> {
  @override
  final Iterable<Type> types = const [LaunchURL, _$LaunchURL];
  @override
  final String wireName = 'LaunchURL';

  @override
  Iterable<Object> serialize(Serializers serializers, LaunchURL object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LaunchURL deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LaunchURLBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LaunchURL extends LaunchURL {
  @override
  final String url;

  factory _$LaunchURL([void Function(LaunchURLBuilder) updates]) =>
      (new LaunchURLBuilder()..update(updates)).build();

  _$LaunchURL._({this.url}) : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('LaunchURL', 'url');
    }
  }

  @override
  LaunchURL rebuild(void Function(LaunchURLBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LaunchURLBuilder toBuilder() => new LaunchURLBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LaunchURL && url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(0, url.hashCode));
  }
}

class LaunchURLBuilder implements Builder<LaunchURL, LaunchURLBuilder> {
  _$LaunchURL _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  LaunchURLBuilder();

  LaunchURLBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LaunchURL other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LaunchURL;
  }

  @override
  void update(void Function(LaunchURLBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LaunchURL build() {
    final _$result = _$v ?? new _$LaunchURL._(url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
