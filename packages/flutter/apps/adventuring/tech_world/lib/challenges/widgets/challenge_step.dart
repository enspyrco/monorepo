import 'package:astro_types/core_types.dart';
import 'package:flutter/material.dart';

import '../models/challenge_task_model.dart';

class ChallengeStep extends Step {
  ChallengeStep(ChallengeTaskModel task, {Key? key})
      : _task = task,
        super(title: Text(task.title), content: Text(task.description));

  final ChallengeTaskModel _task;

  Mission? get startMission => _task.startMission;
  Mission? get endMission => _task.endMission;
}
