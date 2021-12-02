import 'package:adventure_maker/app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:redfire/types.dart';
import 'package:redfire/utils.dart';

extension BuildContextExtension on BuildContext {
  dynamic dispatch(ReduxAction action) => dispatchWith<AppState>(action, this);
}
