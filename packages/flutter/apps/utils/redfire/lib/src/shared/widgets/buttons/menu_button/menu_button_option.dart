import 'package:flutter/widgets.dart';

class MenuButtonOption {
  MenuButtonOption(this.name, this.callback);

  final String name;
  final Function(BuildContext) callback;
}
