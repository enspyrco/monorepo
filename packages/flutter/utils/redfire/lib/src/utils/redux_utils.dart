import 'package:flutter/widgets.dart';

import 'package:flutter_redux/flutter_redux.dart';

import '../../types.dart';

dynamic dispatchWith<T extends RedFireState>(
    ReduxAction action, BuildContext context) {
  return StoreProvider.of<T>(context, listen: false).dispatch(action);
}
