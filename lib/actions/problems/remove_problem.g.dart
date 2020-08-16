// GENERATED CODE - DO NOT MODIFY BY HAND

part of remove_problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RemoveProblem> _$removeProblemSerializer =
    new _$RemoveProblemSerializer();

class _$RemoveProblemSerializer implements StructuredSerializer<RemoveProblem> {
  @override
  final Iterable<Type> types = const [RemoveProblem, _$RemoveProblem];
  @override
  final String wireName = 'RemoveProblem';

  @override
  Iterable<Object> serialize(Serializers serializers, RemoveProblem object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  RemoveProblem deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new RemoveProblemBuilder().build();
  }
}

class _$RemoveProblem extends RemoveProblem {
  factory _$RemoveProblem([void Function(RemoveProblemBuilder) updates]) =>
      (new RemoveProblemBuilder()..update(updates)).build();

  _$RemoveProblem._() : super._();

  @override
  RemoveProblem rebuild(void Function(RemoveProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveProblemBuilder toBuilder() => new RemoveProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveProblem;
  }

  @override
  int get hashCode {
    return 121817455;
  }
}

class RemoveProblemBuilder
    implements Builder<RemoveProblem, RemoveProblemBuilder> {
  _$RemoveProblem _$v;

  RemoveProblemBuilder();

  @override
  void replace(RemoveProblem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RemoveProblem;
  }

  @override
  void update(void Function(RemoveProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RemoveProblem build() {
    final _$result = _$v ?? new _$RemoveProblem._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
