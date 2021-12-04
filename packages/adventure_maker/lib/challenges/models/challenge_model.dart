import 'package:adventure_maker/shared/state/adventure_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'challenge_model.freezed.dart';
part 'challenge_model.g.dart';

@freezed
class ChallengeModel with _$ChallengeModel, ReduxModel, AdventureNode {
  static const String className = 'ChallengeModel';

  const ChallengeModel._();
  const factory ChallengeModel({required String name}) = _ChallengeModel;

  factory ChallengeModel.fromJson(JsonMap json) =>
      _$ChallengeModelFromJson(json);

  @override
  String get typeName => className;
}
