// GENERATED CODE - DO NOT MODIFY BY HAND

part of google_sign_in_credential;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GoogleSignInCredential> _$googleSignInCredentialSerializer =
    new _$GoogleSignInCredentialSerializer();

class _$GoogleSignInCredentialSerializer
    implements StructuredSerializer<GoogleSignInCredential> {
  @override
  final Iterable<Type> types = const [
    GoogleSignInCredential,
    _$GoogleSignInCredential
  ];
  @override
  final String wireName = 'GoogleSignInCredential';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GoogleSignInCredential object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.idToken != null) {
      result
        ..add('idToken')
        ..add(serializers.serialize(object.idToken,
            specifiedType: const FullType(String)));
    }
    if (object.accessToken != null) {
      result
        ..add('accessToken')
        ..add(serializers.serialize(object.accessToken,
            specifiedType: const FullType(String)));
    }
    if (object.serverAuthCode != null) {
      result
        ..add('serverAuthCode')
        ..add(serializers.serialize(object.serverAuthCode,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GoogleSignInCredential deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GoogleSignInCredentialBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'idToken':
          result.idToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'serverAuthCode':
          result.serverAuthCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GoogleSignInCredential extends GoogleSignInCredential {
  @override
  final String idToken;
  @override
  final String accessToken;
  @override
  final String serverAuthCode;

  factory _$GoogleSignInCredential(
          [void Function(GoogleSignInCredentialBuilder) updates]) =>
      (new GoogleSignInCredentialBuilder()..update(updates)).build();

  _$GoogleSignInCredential._(
      {this.idToken, this.accessToken, this.serverAuthCode})
      : super._();

  @override
  GoogleSignInCredential rebuild(
          void Function(GoogleSignInCredentialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoogleSignInCredentialBuilder toBuilder() =>
      new GoogleSignInCredentialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoogleSignInCredential &&
        idToken == other.idToken &&
        accessToken == other.accessToken &&
        serverAuthCode == other.serverAuthCode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, idToken.hashCode), accessToken.hashCode),
        serverAuthCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GoogleSignInCredential')
          ..add('idToken', idToken)
          ..add('accessToken', accessToken)
          ..add('serverAuthCode', serverAuthCode))
        .toString();
  }
}

class GoogleSignInCredentialBuilder
    implements Builder<GoogleSignInCredential, GoogleSignInCredentialBuilder> {
  _$GoogleSignInCredential _$v;

  String _idToken;
  String get idToken => _$this._idToken;
  set idToken(String idToken) => _$this._idToken = idToken;

  String _accessToken;
  String get accessToken => _$this._accessToken;
  set accessToken(String accessToken) => _$this._accessToken = accessToken;

  String _serverAuthCode;
  String get serverAuthCode => _$this._serverAuthCode;
  set serverAuthCode(String serverAuthCode) =>
      _$this._serverAuthCode = serverAuthCode;

  GoogleSignInCredentialBuilder();

  GoogleSignInCredentialBuilder get _$this {
    if (_$v != null) {
      _idToken = _$v.idToken;
      _accessToken = _$v.accessToken;
      _serverAuthCode = _$v.serverAuthCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoogleSignInCredential other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GoogleSignInCredential;
  }

  @override
  void update(void Function(GoogleSignInCredentialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GoogleSignInCredential build() {
    final _$result = _$v ??
        new _$GoogleSignInCredential._(
            idToken: idToken,
            accessToken: accessToken,
            serverAuthCode: serverAuthCode);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
