// GENERATED CODE - DO NOT MODIFY BY HAND

part of team_member;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TeamMember> _$teamMemberSerializer = new _$TeamMemberSerializer();

class _$TeamMemberSerializer implements StructuredSerializer<TeamMember> {
  @override
  final Iterable<Type> types = const [TeamMember, _$TeamMember];
  @override
  final String wireName = 'TeamMember';

  @override
  Iterable<Object> serialize(Serializers serializers, TeamMember object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'lastName',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'photoURL',
      serializers.serialize(object.photoURL,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TeamMember deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TeamMemberBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
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

class _$TeamMember extends TeamMember {
  @override
  final String uid;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String displayName;
  @override
  final String photoURL;

  factory _$TeamMember([void Function(TeamMemberBuilder) updates]) =>
      (new TeamMemberBuilder()..update(updates)).build();

  _$TeamMember._(
      {this.uid,
      this.firstName,
      this.lastName,
      this.displayName,
      this.photoURL})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('TeamMember', 'uid');
    }
    if (firstName == null) {
      throw new BuiltValueNullFieldError('TeamMember', 'firstName');
    }
    if (lastName == null) {
      throw new BuiltValueNullFieldError('TeamMember', 'lastName');
    }
    if (displayName == null) {
      throw new BuiltValueNullFieldError('TeamMember', 'displayName');
    }
    if (photoURL == null) {
      throw new BuiltValueNullFieldError('TeamMember', 'photoURL');
    }
  }

  @override
  TeamMember rebuild(void Function(TeamMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TeamMemberBuilder toBuilder() => new TeamMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeamMember &&
        uid == other.uid &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        displayName == other.displayName &&
        photoURL == other.photoURL;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, uid.hashCode), firstName.hashCode),
                lastName.hashCode),
            displayName.hashCode),
        photoURL.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TeamMember')
          ..add('uid', uid)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('displayName', displayName)
          ..add('photoURL', photoURL))
        .toString();
  }
}

class TeamMemberBuilder implements Builder<TeamMember, TeamMemberBuilder> {
  _$TeamMember _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoURL;
  String get photoURL => _$this._photoURL;
  set photoURL(String photoURL) => _$this._photoURL = photoURL;

  TeamMemberBuilder();

  TeamMemberBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _displayName = _$v.displayName;
      _photoURL = _$v.photoURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeamMember other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TeamMember;
  }

  @override
  void update(void Function(TeamMemberBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TeamMember build() {
    final _$result = _$v ??
        new _$TeamMember._(
            uid: uid,
            firstName: firstName,
            lastName: lastName,
            displayName: displayName,
            photoURL: photoURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
