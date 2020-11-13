// GENERATED CODE - DO NOT MODIFY BY HAND

part of add_problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddProblem> _$addProblemSerializer = new _$AddProblemSerializer();

class _$AddProblemSerializer implements StructuredSerializer<AddProblem> {
  @override
  final Iterable<Type> types = const [AddProblem, _$AddProblem];
  @override
  final String wireName = 'AddProblem';

  @override
  Iterable<Object> serialize(Serializers serializers, AddProblem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'errorString',
      serializers.serialize(object.errorString,
          specifiedType: const FullType(String)),
    ];
    if (object.traceString != null) {
      result
        ..add('traceString')
        ..add(serializers.serialize(object.traceString,
            specifiedType: const FullType(String)));
    }
    if (object.info != null) {
      result
        ..add('info')
        ..add(serializers.serialize(object.info,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(Object)])));
    }
    return result;
  }

  @override
  AddProblem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddProblemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'errorString':
          result.errorString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'traceString':
          result.traceString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'info':
          result.info.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Object)])));
          break;
      }
    }

    return result.build();
  }
}

class _$AddProblem extends AddProblem {
  @override
  final String errorString;
  @override
  final String traceString;
  @override
  final BuiltMap<String, Object> info;

  factory _$AddProblem([void Function(AddProblemBuilder) updates]) =>
      (new AddProblemBuilder()..update(updates)).build();

  _$AddProblem._({this.errorString, this.traceString, this.info}) : super._() {
    if (errorString == null) {
      throw new BuiltValueNullFieldError('AddProblem', 'errorString');
    }
  }

  @override
  AddProblem rebuild(void Function(AddProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddProblemBuilder toBuilder() => new AddProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddProblem &&
        errorString == other.errorString &&
        traceString == other.traceString &&
        info == other.info;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, errorString.hashCode), traceString.hashCode),
        info.hashCode));
  }
}

class AddProblemBuilder implements Builder<AddProblem, AddProblemBuilder> {
  _$AddProblem _$v;

  String _errorString;
  String get errorString => _$this._errorString;
  set errorString(String errorString) => _$this._errorString = errorString;

  String _traceString;
  String get traceString => _$this._traceString;
  set traceString(String traceString) => _$this._traceString = traceString;

  MapBuilder<String, Object> _info;
  MapBuilder<String, Object> get info =>
      _$this._info ??= new MapBuilder<String, Object>();
  set info(MapBuilder<String, Object> info) => _$this._info = info;

  AddProblemBuilder();

  AddProblemBuilder get _$this {
    if (_$v != null) {
      _errorString = _$v.errorString;
      _traceString = _$v.traceString;
      _info = _$v.info?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddProblem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddProblem;
  }

  @override
  void update(void Function(AddProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddProblem build() {
    _$AddProblem _$result;
    try {
      _$result = _$v ??
          new _$AddProblem._(
              errorString: errorString,
              traceString: traceString,
              info: _info?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'info';
        _info?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddProblem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
