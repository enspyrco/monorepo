import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/types/red_fire_state.dart';
import 'package:redfire/types/redux_action.dart';

extension BuildContextExtension on BuildContext {
  dynamic dispatch<T extends RedFireState>(ReduxAction action) {
    return StoreProvider.of<T>(this, listen: false).dispatch(action);
  }

  dynamic dispatchAndListen<T extends RedFireState>(ReduxAction action) {
    return StoreProvider.of<T>(this).dispatch(action);
  }
}
