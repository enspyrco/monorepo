import 'package:adventure_maker/adventures/widgets/adventures_drop_down.dart';
import 'package:adventure_maker/app_state.dart';
import 'package:adventure_maker/shared/pages/new_item_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AdventuresDropDown(),
        ),
      ),
      // body: const Padding(
      //   padding: EdgeInsets.all(30.0),
      //   child: NewItemDialogContent(),
      // ),
    );
  }
}
