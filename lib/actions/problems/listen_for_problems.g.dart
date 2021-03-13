// GENERATED CODE - DO NOT MODIFY BY HAND

part of listen_for_problems;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListenForProblems> _$listenForProblemsSerializer =
    new _$ListenForProblemsSerializer();

class _$ListenForProblemsSerializer
    implements StructuredSerializer<ListenForProblems> {
  @override
  final Iterable<Type> types = const [ListenForProblems, _$ListenForProblems];
  @override
  final String wireName = 'ListenForProblems';

  @override
  Iterable<Object?> serialize(Serializers serializers, ListenForProblems object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  ListenForProblems deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new ListenForProblemsBuilder().build();
  }
}

class _$ListenForProblems extends ListenForProblems {
  factory _$ListenForProblems(
          [void Function(ListenForProblemsBuilder)? updates]) =>
      (new ListenForProblemsBuilder()..update(updates)).build();

  _$ListenForProblems._() : super._();

  @override
  ListenForProblems rebuild(void Function(ListenForProblemsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListenForProblemsBuilder toBuilder() =>
      new ListenForProblemsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListenForProblems;
  }

  @override
  int get hashCode {
    return 157228787;
  }
}

class ListenForProblemsBuilder
    implements Builder<ListenForProblems, ListenForProblemsBuilder> {
  _$ListenForProblems? _$v;

  ListenForProblemsBuilder();

  @override
  void replace(ListenForProblems other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListenForProblems;
  }

  @override
  void update(void Function(ListenForProblemsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListenForProblems build() {
    final _$result = _$v ?? new _$ListenForProblems._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
