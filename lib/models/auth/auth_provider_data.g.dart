// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_provider_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthProviderData> _$authProviderDataSerializer =
    new _$AuthProviderDataSerializer();

class _$AuthProviderDataSerializer
    implements StructuredSerializer<AuthProviderData> {
  @override
  final Iterable<Type> types = const [AuthProviderData, _$AuthProviderData];
  @override
  final String wireName = 'AuthProviderData';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthProviderData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'providerId',
      serializers.serialize(object.providerId,
          specifiedType: const FullType(String)),
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.displayName;
    if (value != null) {
      result
        ..add('displayName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoURL;
    if (value != null) {
      result
        ..add('photoURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AuthProviderData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthProviderDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'providerId':
          result.providerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthProviderData extends AuthProviderData {
  @override
  final String providerId;
  @override
  final String uid;
  @override
  final String? displayName;
  @override
  final String? photoURL;
  @override
  final String? email;
  @override
  final String? phoneNumber;

  factory _$AuthProviderData(
          [void Function(AuthProviderDataBuilder)? updates]) =>
      (new AuthProviderDataBuilder()..update(updates)).build();

  _$AuthProviderData._(
      {required this.providerId,
      required this.uid,
      this.displayName,
      this.photoURL,
      this.email,
      this.phoneNumber})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        providerId, 'AuthProviderData', 'providerId');
    BuiltValueNullFieldError.checkNotNull(uid, 'AuthProviderData', 'uid');
  }

  @override
  AuthProviderData rebuild(void Function(AuthProviderDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthProviderDataBuilder toBuilder() =>
      new AuthProviderDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthProviderData &&
        providerId == other.providerId &&
        uid == other.uid &&
        displayName == other.displayName &&
        photoURL == other.photoURL &&
        email == other.email &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, providerId.hashCode), uid.hashCode),
                    displayName.hashCode),
                photoURL.hashCode),
            email.hashCode),
        phoneNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthProviderData')
          ..add('providerId', providerId)
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('photoURL', photoURL)
          ..add('email', email)
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class AuthProviderDataBuilder
    implements Builder<AuthProviderData, AuthProviderDataBuilder> {
  _$AuthProviderData? _$v;

  String? _providerId;
  String? get providerId => _$this._providerId;
  set providerId(String? providerId) => _$this._providerId = providerId;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoURL;
  String? get photoURL => _$this._photoURL;
  set photoURL(String? photoURL) => _$this._photoURL = photoURL;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  AuthProviderDataBuilder();

  AuthProviderDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providerId = $v.providerId;
      _uid = $v.uid;
      _displayName = $v.displayName;
      _photoURL = $v.photoURL;
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthProviderData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthProviderData;
  }

  @override
  void update(void Function(AuthProviderDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthProviderData build() {
    final _$result = _$v ??
        new _$AuthProviderData._(
            providerId: BuiltValueNullFieldError.checkNotNull(
                providerId, 'AuthProviderData', 'providerId'),
            uid: BuiltValueNullFieldError.checkNotNull(
                uid, 'AuthProviderData', 'uid'),
            displayName: displayName,
            photoURL: photoURL,
            email: email,
            phoneNumber: phoneNumber);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
