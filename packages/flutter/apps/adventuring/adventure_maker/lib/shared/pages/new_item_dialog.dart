import 'package:astro/astro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../_app/state/app_state.dart';
import '../../adventures/models/adventure_model.dart';
import '../../challenges/models/challenge_model.dart';
import '../extensions/build_context_extension.dart';
import '../missions/create_adventure_node.dart';
import '../models/adventure_node.dart';
import '../models/drop_down_model.dart';
import '../widgets/adventure_nodes_drop_down.dart';

Future<void> showNewItemDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        var controller = TextEditingController();
        return AlertDialog(
          title: const Text('Make a New Item?'),
          content: NewItemDialogContent(controller),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                context.launch(CreateAdventureNode(controller.text));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

class NewItemDialogContent extends StatelessWidget {
  const NewItemDialogContent(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<AppState, AdventureNode?>(
        // Get the 'last' selection, ie. furtherst from the root of the tree.
        transformer: (state) => (state.steps.selected ??
            state.tasks.selected ??
            state.challenges.selected ??
            state.adventures.selected) as AdventureNode?,
        builder: (context, lastSelection) {
          var seenEnter = false; // only perform dispatch on Enter once
          return SingleChildScrollView(
              child: ListBody(
            children: <Widget>[
              Focus(
                onKeyEvent: (node, event) {
                  if (!seenEnter &&
                      event.physicalKey == PhysicalKeyboardKey.enter) {
                    seenEnter = true;
                    context.launch(CreateAdventureNode(controller.text));
                    Navigator.of(context).pop();
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      helperText:
                          'name of ${AdventureNode.nextName(lastSelection)}',
                      border: const OutlineInputBorder()),
                  autofocus: true,
                ),
              ),
              const SizedBox(height: 20),
              if (lastSelection != null) ...[
                const NewItemDialogText('Located In...'),
                const SizedBox(height: 20),
                Container(
                  color: Colors.blue[100],
                  child: Stack(children: [
                    Text('Adventure',
                        style: TextStyle(
                            color: Colors.blue.shade900, fontSize: 12)),
                    Center(
                      child: AdventureNodesDropDown<AdventureModel>(
                        transformer: (state) => DropDownModel<AdventureModel>(
                            state.adventures.selected, state.adventures.all),
                      ),
                    )
                  ]),
                ),
                if (lastSelection.isChallenge()) ...[
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.green[100],
                    child: Stack(children: [
                      Text('Challenge',
                          style: TextStyle(
                              color: Colors.green.shade900, fontSize: 12)),
                      Center(
                        child: AdventureNodesDropDown<ChallengeModel>(
                          transformer: (state) => DropDownModel<ChallengeModel>(
                              state.challenges.selected, state.challenges.all),
                        ),
                      )
                    ]),
                  ),
                ]
              ]
            ],
          ));
        });
  }
}

class NewItemDialogText extends StatelessWidget {
  const NewItemDialogText(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(text,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12)));
  }
}
