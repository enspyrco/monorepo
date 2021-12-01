import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/models/selections.dart';
import 'package:adventure_maker/widgets/items_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

Future<void> showNewItemDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Make a New Item?'),
          content: const NewItemDialogContent(),
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

class NewItemDialogContent extends StatelessWidget {
  const NewItemDialogContent({
    Key? key,
  }) : super(key: key);

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
                    const Center(child: ItemsDropdown())
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
