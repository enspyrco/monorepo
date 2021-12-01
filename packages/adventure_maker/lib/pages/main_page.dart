import 'package:adventure_maker/main.dart';
import 'package:adventure_maker/models/selections.dart';
import 'package:adventure_maker/widgets/items_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/widgets.dart';

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
        _showNewItemDialog(context).then<void>((_) => showingDialog = false);
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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: ItemsDropdown(),
        ),
      ),
      // body: const Padding(
      //   padding: EdgeInsets.all(30.0),
      //   child: NewItemDialogContent(),
      // ),
    );
  }
}

Future<void> _showNewItemDialog(BuildContext context) async {
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
                const NewItemDialogtext('Located In...'),
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

class NewItemDialogtext extends StatelessWidget {
  const NewItemDialogtext(
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
