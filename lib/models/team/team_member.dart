import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_member.freezed.dart';
part 'team_member.g.dart';

@freezed
class TeamMember with _$TeamMember {
  factory TeamMember({
    required String uid,
    required String firstName,
    required String lastName,
    required String displayName,
    required String photoURL,
  }) = _TeamMember;

  factory TeamMember.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberFromJson(json);
}

// library team_member;

// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import 'package:the_process/serializers.dart';

// part 'team_member.g.dart';

// abstract class TeamMember implements Built<TeamMember, TeamMemberBuilder> {
//   String get uid;
//   String get firstName;
//   String get lastName;
//   String get displayName;
//   String get photoURL;

//   TeamMember._();

//   factory TeamMember(
//       {required String uid,
//       required String firstName,
//       required String lastName,
//       required String displayName,
//       required String photoURL}) = _$TeamMember._;

//   factory TeamMember.by([void Function(TeamMemberBuilder) updates]) =
//       _$TeamMember;

//   Object toJson() => serializers.serializeWith(TeamMember.serializer, this);

//   // static TeamMember fromJson(String jsonString) => serializers.deserializeWith(
//   //     TeamMember.serializer, json.decode(jsonString));

//   static Serializer<TeamMember> get serializer => _$teamMemberSerializer;
// }
