import 'package:flutter/widgets.dart';
import 'package:redfire/types.dart';
import 'package:redfire/utils.dart';
import 'package:tech_world/redux/app_state.dart';

extension BuildContextExtension on BuildContext {
  dynamic dispatch(ReduxAction action) => dispatchWith<AppState>(action, this);
}
