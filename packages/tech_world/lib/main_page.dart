import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/widgets.dart';
import 'package:tech_world/challenges/actions/start_challenge_action.dart';
import 'package:tech_world/challenges/enums/challenge_enum.dart';
import 'package:tech_world/challenges/models/challenge_model.dart';
import 'package:tech_world/challenges/widgets/challenge_stepper.dart';
import 'package:tech_world/redux/app_state.dart';
import 'package:tech_world/tech_world_game.dart';
import 'package:tech_world/utils/extensions/build_context_extensions.dart';

class MainPage extends StatelessWidget {
  const MainPage({required TechWorldGame game, Key? key})
      : _game = game,
        super(key: key);

  final TechWorldGame _game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            FloatingActionButton.small(
              child: const Text('+'),
              onPressed: () => context.dispatch(
                const StartChallengeAction(ChallengeEnum.fixRepo),
              ),
            ),
            const AccountButton<AppState>(),
          ],
        ),
        body: StoreConnector<AppState, ChallengeModel?>(
          distinct: true,
          converter: (store) => store.state.challenge,
          builder: (context, challenge) {
            return Stack(
              children: [
                GameWidget(game: _game),
                if (challenge != null) ChallengeStepper(challenge)
              ],
            );
          },
        ));
  }
}
