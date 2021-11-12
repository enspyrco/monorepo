import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChallengeStepper extends StatefulWidget {
  const ChallengeStepper({Key? key}) : super(key: key);

  @override
  State<ChallengeStepper> createState() => _ChallengeStepperState();
}

const _url = 'https://github.com/adventures-in/devtools_adventure';

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
          onStepTapped: (index) => (index == 1) ? _launchURL() : null,
        ));
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
