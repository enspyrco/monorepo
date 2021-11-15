import 'package:flutter/material.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/challenges/models/challenge_task_model.dart';

class ChallengeStep extends Step {
  ChallengeStep(ChallengeTaskModel task, {Key? key})
      : _task = task,
        super(title: Text(task.title), content: Text(task.description));

  final ChallengeTaskModel _task;

  ReduxAction? get startAction => _task.startAction;
  ReduxAction? get endAction => _task.endAction;
}
