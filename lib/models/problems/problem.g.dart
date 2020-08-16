// GENERATED CODE - DO NOT MODIFY BY HAND

part of problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Problem> _$problemSerializer = new _$ProblemSerializer();

class _$ProblemSerializer implements StructuredSerializer<Problem> {
  @override
  final Iterable<Type> types = const [Problem, _$Problem];
  @override
  final String wireName = 'Problem';

  @override
  Iterable<Object> serialize(Serializers serializers, Problem object,
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
  Problem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProblemBuilder();

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

class _$Problem extends Problem {
  @override
  final String errorString;
  @override
  final String traceString;
  @override
  final BuiltMap<String, Object> info;

  factory _$Problem([void Function(ProblemBuilder) updates]) =>
      (new ProblemBuilder()..update(updates)).build();

  _$Problem._({this.errorString, this.traceString, this.info}) : super._() {
    if (errorString == null) {
      throw new BuiltValueNullFieldError('Problem', 'errorString');
    }
  }

  @override
  Problem rebuild(void Function(ProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProblemBuilder toBuilder() => new ProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Problem &&
        errorString == other.errorString &&
        traceString == other.traceString &&
        info == other.info;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, errorString.hashCode), traceString.hashCode),
        info.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Problem')
          ..add('errorString', errorString)
          ..add('traceString', traceString)
          ..add('info', info))
        .toString();
  }
}

class ProblemBuilder implements Builder<Problem, ProblemBuilder> {
  _$Problem _$v;

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

  ProblemBuilder();

  ProblemBuilder get _$this {
    if (_$v != null) {
      _errorString = _$v.errorString;
      _traceString = _$v.traceString;
      _info = _$v.info?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Problem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Problem;
  }

  @override
  void update(void Function(ProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Problem build() {
    _$Problem _$result;
    try {
      _$result = _$v ??
          new _$Problem._(
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
            'Problem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
