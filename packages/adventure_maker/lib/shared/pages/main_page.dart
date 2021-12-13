import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:redfire/widgets.dart';

import '../../adventures/models/adventure_model.dart';
import '../../app_state.dart';
import '../../challenges/models/challenge_model.dart';
import '../../steps/models/step_model.dart';
import '../../tasks/models/task_model.dart';
import '../models/drop_down_model.dart';
import '../widgets/adventure_nodes_drop_down.dart';
import 'new_item_dialog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        actions: const [AccountButton<AppState>()],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AdventureNodesDropDown<AdventureModel>(
                  converter: (store) => DropDownModel<AdventureModel>(
                      store.state.adventures.selected,
                      store.state.adventures.all),
                ),
                AdventureNodesDropDown<ChallengeModel>(
                  converter: (store) => DropDownModel<ChallengeModel>(
                      store.state.challenges.selected,
                      store.state.challenges.all),
                ),
                AdventureNodesDropDown<TaskModel>(
                  converter: (store) => DropDownModel<TaskModel>(
                      store.state.tasks.selected, store.state.tasks.all),
                ),
                AdventureNodesDropDown<StepModel>(
                  converter: (store) => DropDownModel<StepModel>(
                      store.state.steps.selected, store.state.steps.all),
                ),
              ],
            )),
      ),
    );
  }
}
