import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'read_challenges_action.freezed.dart';
part 'read_challenges_action.g.dart';

@freezed
class ReadChallengesAction with _$ReadChallengesAction, ReduxAction {
  static const String className = 'ReadChallengesAction';

  const ReadChallengesAction._();
  const factory ReadChallengesAction() = _ReadChallengesAction;

  factory ReadChallengesAction.fromJson(JsonMap json) =>
      _$ReadChallengesActionFromJson(json);

  @override
  String get typeName => className;
}
