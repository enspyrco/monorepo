import 'package:adventure_maker/adventures/widgets/adventures_drop_down.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/actions/create_adventure_part_action.dart';
import 'package:adventure_maker/shared/extensions/build_context_extension.dart';
import 'package:adventure_maker/shared/models/selections.dart';
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
                context.dispatch(CreateAdventurePartAction(controller.text));
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
    return StoreConnector<AppState, Selections>(
        distinct: true,
        converter: (store) => Selections(
            store.state.adventures.selected,
            store.state.challenges.selected,
            store.state.selectedTask,
            store.state.selectedStep),
        builder: (context, selections) {
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
                        .dispatch(CreateAdventurePartAction(controller.text));
                    Navigator.of(context).pop();
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      helperText: 'name of ${selections.leafName}',
                      border: const OutlineInputBorder()),
                  autofocus: true,
                ),
              ),
              const SizedBox(height: 20),
              if (selections.adventure != null) ...[
                const NewItemDialogText('Located In...'),
                const SizedBox(height: 20),
                Container(
                  color: Colors.blue[100],
                  child: Stack(children: [
                    Text('Adventure',
                        style: TextStyle(
                            color: Colors.blue.shade900, fontSize: 12)),
                    const Center(child: AdventuresDropDown())
                  ]),
                ),
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
