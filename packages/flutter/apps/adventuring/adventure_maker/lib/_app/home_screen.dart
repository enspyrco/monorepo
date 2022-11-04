import 'package:astro_auth/astro_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../adventures/models/adventure_model.dart';
import '../challenges/models/challenge_model.dart';
import '../shared/models/drop_down_model.dart';
import '../shared/pages/new_item_dialog.dart';
import '../shared/widgets/adventure_nodes_drop_down.dart';
import '../steps/models/step_model.dart';
import '../tasks/models/task_model.dart';
import 'state/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showingDialog = false;

  /// Add a handler to [HardwareKeyboard] to handle Cmd-N.
  /// The handler shows a dialog for making a new item.
  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler((event) {
      // If both Cmd and N are down, show a dialog, but we make sure a dialog
      // is not already showing.
      var pressed = HardwareKeyboard.instance.logicalKeysPressed;
      if (!showingDialog &&
          pressed.contains(LogicalKeyboardKey.keyN) &&
          (pressed.contains(LogicalKeyboardKey.metaLeft) ||
              pressed.contains(LogicalKeyboardKey.metaRight))) {
        showingDialog = true;
        showNewItemDialog(context).then<void>((_) => showingDialog = false);
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          AvatarMenuButton<AppState>(
            options: {MenuOption('Sign Out', SignOut<AppState>())},
          )
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdventureNodesDropDown<AdventureModel>(
                  transformer: (state) => DropDownModel<AdventureModel>(
                      state.adventures.selected, state.adventures.all),
                ),
                AdventureNodesDropDown<ChallengeModel>(
                  transformer: (state) => DropDownModel<ChallengeModel>(
                      state.challenges.selected, state.challenges.all),
                ),
                AdventureNodesDropDown<TaskModel>(
                  transformer: (state) => DropDownModel<TaskModel>(
                      state.tasks.selected, state.tasks.all),
                ),
                AdventureNodesDropDown<StepModel>(
                  transformer: (state) => DropDownModel<StepModel>(
                      state.steps.selected, state.steps.all),
                ),
              ],
            )),
      ),
    );
  }
}
