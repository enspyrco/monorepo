import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

class EmptyReducer<T extends RedFireState> extends TypedReducer<T, Object> {
  EmptyReducer() : super((state, action) => state);
}

void emptyAppReducer(dynamic _) {
  return;
}
