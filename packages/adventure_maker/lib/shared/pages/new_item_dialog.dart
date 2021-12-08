import 'package:adventure_maker/adventures/models/adventure_model.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/challenges/models/challenge_model.dart';
import 'package:adventure_maker/shared/actions/create_adventure_node_action.dart';
import 'package:adventure_maker/shared/extensions/build_context_extension.dart';
import 'package:adventure_maker/shared/models/adventure_node.dart';
import 'package:adventure_maker/shared/models/drop_down_model.dart';
import 'package:adventure_maker/shared/widgets/adventure_nodes_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
                context.dispatch(CreateAdventureNodeAction(controller.text));
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
    return StoreConnector<AppState, AdventureNode?>(
        distinct: true,
        // Get the 'last' selection, ie. furtherst from the root of the tree.
        converter: (store) => (store.state.steps.selected ??
            store.state.tasks.selected ??
            store.state.challenges.selected ??
            store.state.adventures.selected) as AdventureNode?,
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
                    context
                        .dispatch(CreateAdventureNodeAction(controller.text));
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
                        converter: (store) => DropDownModel<AdventureModel>(
                            store.state.adventures.selected,
                            store.state.adventures.all),
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
                          converter: (store) => DropDownModel<ChallengeModel>(
                              store.state.challenges.selected,
                              store.state.challenges.all),
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
