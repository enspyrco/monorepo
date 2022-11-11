import 'package:astro/astro.dart';
import 'package:astro_auth/astro_auth.dart';
import 'package:astro_locator/astro_locator.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../challenges/enums/challenge_enum.dart';
import '../challenges/missions/dismiss_challenge.dart';
import '../challenges/missions/start_challenge.dart';
import '../challenges/models/challenge_model.dart';
import '../challenges/widgets/challenge_stepper.dart';
import '../game/tech_world_game.dart';
import '../utils/extensions/build_context_extensions.dart';
import 'state/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, ChallengeModel?>(
      transformer: (state) => state.challenge,
      builder: (context, challenge) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (challenge == null)
                const StartChallengeButton()
              else
                const DismissChallengeButton(),
              const AvatarMenuButton<AppState>(
                options: {MenuOption('Sign Out', SignOut<AppState>())},
              ),
            ],
          ),
          body: Stack(
            children: [
              GameWidget(game: locate<TechWorldGame>()),
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
      onPressed: () => context.land(
        const StartChallenge(challengeType: ChallengeEnum.fixRepo),
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
      onPressed: () => context.land(const DismissChallenge()),
    );
  }
}
