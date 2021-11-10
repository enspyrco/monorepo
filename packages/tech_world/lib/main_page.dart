import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:redfire/widgets.dart';
import 'package:tech_world/redux/app_state.dart';
import 'package:tech_world/tech_world_game.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  const MainPage({required TechWorldGame game, Key? key})
      : _game = game,
        super(key: key);

  final TechWorldGame _game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [AccountButton<AppState>()],
      ),
      body: Stack(
        children: [GameWidget(game: _game), const BasicStepper()],
      ),
    );
  }
}
// bottom: const PreferredSize(
//             preferredSize: Size(300.0, 120.0),
//             child: BasicStepper(),
//           )),

class BasicStepper extends StatefulWidget {
  const BasicStepper({Key? key}) : super(key: key);

  @override
  State<BasicStepper> createState() => _BasicStepperState();
}

const _url = 'https://github.com/adventures-in/devtools_adventure';

class _BasicStepperState extends State<BasicStepper> {
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
