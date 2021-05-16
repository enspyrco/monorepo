import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/app_state.dart';
import 'package:redfire/types/redux_action.dart';

extension StoreProviderDispatch on BuildContext {
  dynamic dispatch(ReduxAction action) {
    return StoreProvider.of<AppState>(this, listen: false).dispatch(action);
  }

  dynamic dispatchAndListen(ReduxAction action) {
    return StoreProvider.of<AppState>(this).dispatch(action);
  }
}

extension StoreProviderGetState on BuildContext {
  AppState get appState {
    return StoreProvider.of<AppState>(this).state;
  }
}
