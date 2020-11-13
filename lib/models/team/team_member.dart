library team_member;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'package:the_process/serializers.dart';

part 'team_member.g.dart';

abstract class TeamMember implements Built<TeamMember, TeamMemberBuilder> {
  String get uid;
  String get firstName;
  String get lastName;
  String get displayName;
  String get photoURL;

  TeamMember._();

  factory TeamMember(
      {@required String uid,
      String firstName,
      String lastName,
      @required String displayName,
      @required String photoURL}) = _$TeamMember._;

  factory TeamMember.by([void Function(TeamMemberBuilder) updates]) =
      _$TeamMember;

  Object toJson() => serializers.serializeWith(TeamMember.serializer, this);

  static TeamMember fromJson(String jsonString) => serializers.deserializeWith(
      TeamMember.serializer, json.decode(jsonString));

  static Serializer<TeamMember> get serializer => _$teamMemberSerializer;
}
