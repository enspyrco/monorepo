import 'package:flutter/material.dart';

import '../models/challenge_model.dart';
import 'task_description_view.dart';

class ChallengeStepper extends StatefulWidget {
  const ChallengeStepper(ChallengeModel challenge, {Key? key})
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
                const SizedBox(
                    height: 300,
                    child: TaskDescriptionView(markdown: _markdownData)),
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

const String _markdownData = '''
 # Minimal Markdown Test
 ---
 [This](https://google.com) is a simple Markdown test. Provide a text string with Markdown tags
 to the Markdown widget and it will display the formatted output in a
 scrollable widget.

 ## Section 1
 Maecenas eget **arcu egestas**, mollis ex vitae, posuere magna. Nunc eget
 aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis
 eget est condimentum, vitae porttitor diam ornare.

 ### Subsection A
 Sed et massa finibus, blandit massa vel, vulputate velit. Vestibulum vitae
 venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend
 accumsan ante.__** Sed a fermentum elit. Curabitur sodales metus id mi
 ornare, in ullamcorper magna congue.
 ''';
