import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/widgets.dart';

import '../../app_state.dart';
import '../../challenges/actions/dismiss_challenge_action.dart';
import '../../challenges/actions/start_challenge_action.dart';
import '../../challenges/enums/challenge_enum.dart';
import '../../challenges/models/challenge_model.dart';
import '../../challenges/widgets/challenge_stepper.dart';
import '../../game/tech_world_game.dart';
import '../../utils/extensions/build_context_extensions.dart';

class MainPage extends StatelessWidget {
  const MainPage({required TechWorldGame game, Key? key})
      : _game = game,
        super(key: key);

  final TechWorldGame _game;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChallengeModel?>(
      distinct: true,
      converter: (store) => store.state.challenge,
      builder: (context, challenge) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (challenge == null)
                const StartChallengeButton()
              else
                const DismissChallengeButton(),
              const AccountButton<AppState>(),
            ],
          ),
          body: Stack(
            children: [
              GameWidget(game: _game),
              if (challenge != null) ChallengeStepper(challenge)
            ],
          ),
        );
      },
    );
  }
}

class StartChallengeButton extends StatelessWidget {
  const StartChallengeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      child: const Text('+'),
      onPressed: () => context.dispatch(
        const StartChallengeAction(ChallengeEnum.fixRepo),
      ),
    );
  }
}

class DismissChallengeButton extends StatelessWidget {
  const DismissChallengeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      child: const Text('X'),
      onPressed: () => context.dispatch(
        const DismissChallengeAction(),
      ),
    );
  }
}
