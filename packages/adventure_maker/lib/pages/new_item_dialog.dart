import 'package:adventure_maker/actions/create_adventure_action.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/models/selections.dart';
import 'package:adventure_maker/utils/extensions/build_context_extension.dart';
import 'package:adventure_maker/widgets/adventures_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

Future<void> showNewItemDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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
                context.dispatch(CreateAdventureAction(controller.text));
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
            store.state.selectedAdventure,
            store.state.selectedChallenge,
            store.state.selectedTask,
            store.state.selectedStep),
        builder: (context, selections) {
          return SingleChildScrollView(
              child: ListBody(
            children: <Widget>[
              TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      helperText: 'name of ${selections.leafName}',
                      border: const OutlineInputBorder()),
                  autofocus: true),
              const SizedBox(height: 20),
              if (selections.adventure != null) ...[
                const NewItemDialogText('Located In...'),
                const SizedBox(height: 20),
                Container(
                  color: Colors.blue[100],
                  child: Stack(children: [
                    Text(
                      'Adventure',
                      style:
                          TextStyle(color: Colors.blue.shade900, fontSize: 12),
                    ),
                    const Center(child: AdventuresDropdown())
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
