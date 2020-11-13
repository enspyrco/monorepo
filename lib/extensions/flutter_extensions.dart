import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_process/actions/redux_action.dart';
import 'package:the_process/models/app_state/app_state.dart';

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
