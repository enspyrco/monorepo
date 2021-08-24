import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

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

  factory TeamMember.fromJson(JsonMap json) => _$TeamMemberFromJson(json);
}
