import 'package:redux/redux.dart';

import '../test-data/app_state.dart';

class EmptyReducer extends TypedReducer<AppState, Object> {
  EmptyReducer() : super((state, action) => state);
}
