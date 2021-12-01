import 'package:adventure_maker/main.dart';
import 'package:adventure_maker/widgets/items_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redfire/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool keyUp = true;

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler((event) {
      var down = HardwareKeyboard.instance.logicalKeysPressed;
      if (down.contains(LogicalKeyboardKey.keyN) &&
          (down.contains(LogicalKeyboardKey.metaLeft) ||
              down.contains(LogicalKeyboardKey.metaRight))) {
        _showMyDialog(context);
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
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: NewItemDialogContent(),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('New Item'),
        content: const NewItemDialogContent(),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class NewItemDialogContent extends StatelessWidget {
  const NewItemDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: const <Widget>[
          TextField(
            decoration: InputDecoration(
              helperText: 'name',
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          SizedBox(height: 20),
          Text('Would you like to approve of this message?'),
        ],
      ),
    );
  }
}
