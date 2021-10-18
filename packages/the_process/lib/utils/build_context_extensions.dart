import 'package:flutter/widgets.dart';
import 'package:redfire/types.dart';
import 'package:redfire/utils.dart';
import 'package:the_process/main.dart';

extension BuildContextExtension on BuildContext {
  dynamic dispatch(ReduxAction action) => dispatchWith<AppState>(action, this);
}
