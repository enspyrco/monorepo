// GENERATED CODE - DO NOT MODIFY BY HAND

part of flireator;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Flireator> _$flireatorSerializer = new _$FlireatorSerializer();

class _$FlireatorSerializer implements StructuredSerializer<Flireator> {
  @override
  final Iterable<Type> types = const [Flireator, _$Flireator];
  @override
  final String wireName = 'Flireator';

  @override
  Iterable<Object> serialize(Serializers serializers, Flireator object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
    ];
    if (object.displayName != null) {
      result
        ..add('displayName')
        ..add(serializers.serialize(object.displayName,
            specifiedType: const FullType(String)));
    }
    if (object.photoURL != null) {
      result
        ..add('photoURL')
        ..add(serializers.serialize(object.photoURL,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Flireator deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FlireatorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoURL':
          result.photoURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Flireator extends Flireator {
  @override
  final String id;
  @override
  final String displayName;
  @override
  final String photoURL;

  factory _$Flireator([void Function(FlireatorBuilder) updates]) =>
      (new FlireatorBuilder()..update(updates)).build();

  _$Flireator._({this.id, this.displayName, this.photoURL}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Flireator', 'id');
    }
  }

  @override
  Flireator rebuild(void Function(FlireatorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlireatorBuilder toBuilder() => new FlireatorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Flireator &&
        id == other.id &&
        displayName == other.displayName &&
        photoURL == other.photoURL;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), displayName.hashCode), photoURL.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Flireator')
          ..add('id', id)
          ..add('displayName', displayName)
          ..add('photoURL', photoURL))
        .toString();
  }
}

class FlireatorBuilder implements Builder<Flireator, FlireatorBuilder> {
  _$Flireator _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoURL;
  String get photoURL => _$this._photoURL;
  set photoURL(String photoURL) => _$this._photoURL = photoURL;

  FlireatorBuilder();

  FlireatorBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _displayName = _$v.displayName;
      _photoURL = _$v.photoURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Flireator other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Flireator;
  }

  @override
  void update(void Function(FlireatorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Flireator build() {
    final _$result = _$v ??
        new _$Flireator._(id: id, displayName: displayName, photoURL: photoURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
