import 'package:flutter/widgets.dart';

import 'package:flutter_redux/flutter_redux.dart';

import '../../types/red_fire_state.dart';
import '../../types/redux_action.dart';

extension BuildContextExtension on BuildContext {
  dynamic dispatch<T extends RedFireState>(ReduxAction action) {
    return StoreProvider.of<T>(this, listen: false).dispatch(action);
  }

  dynamic dispatchAndListen<T extends RedFireState>(ReduxAction action) {
    return StoreProvider.of<T>(this).dispatch(action);
  }

  RedFireState getAppState<T extends RedFireState>() {
    return StoreProvider.of<T>(this).state;
  }
}
