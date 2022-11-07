import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';

import 'challenge_model.dart';
import 'challenge_task_model.dart';

class FixRepoChallengeModel with ChallengeModel implements AstroState {
  const FixRepoChallengeModel({required this.repoUrl, required this.tasks});

  final String repoUrl;
  @override
  final List<ChallengeTaskModel> tasks;

  @override
  FixRepoChallengeModel copyWith({
    String? repoUrl,
    List<ChallengeTaskModel>? tasks,
  }) =>
      FixRepoChallengeModel(
          repoUrl: repoUrl ?? this.repoUrl, tasks: tasks ?? this.tasks);

  @override
  JsonMap toJson() => {};

  @override
  String get typeName => 'FixRepoChallengeModel';
}
