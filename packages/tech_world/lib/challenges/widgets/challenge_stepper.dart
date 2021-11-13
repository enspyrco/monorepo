import 'package:flutter/material.dart';
import 'package:tech_world/challenges/models/challenge_model.dart';

class ChallengeStepper extends StatefulWidget {
  const ChallengeStepper(@ChallengeModelConverter() ChallengeModel challenge,
      {Key? key})
      : _challenge = challenge,
        super(key: key);

  final ChallengeModel _challenge;

  @override
  State<ChallengeStepper> createState() => _ChallengeStepperState();
}

class _ChallengeStepperState extends State<ChallengeStepper> {
  final int _index = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: const Size.fromHeight(200),
        child: Stepper(
            currentStep: _index,
            controlsBuilder: (BuildContext context, ControlsDetails details) =>
                const SizedBox(),
            type: StepperType.horizontal,
            steps: const [
              Step(title: CircularProgressIndicator(), content: SizedBox()),
              Step(title: Text('c'), content: SizedBox()),
              Step(title: Text('a'), content: SizedBox()),
              Step(title: Text('c'), content: SizedBox())
            ],
            onStepTapped: (index) {
              print(widget._challenge.tasks[index]);
              // if(task.)
            }));
  }
}
