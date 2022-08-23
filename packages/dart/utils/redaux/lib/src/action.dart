import 'middleware.dart';
import 'reducer.dart';
import 'state.dart';

class Action {
  final List<AsyncAction> history = [];
}

abstract class SyncAction<S extends State> extends Action {
  Reducer<S>? get reducer;
}

abstract class AsyncAction<S extends State> extends Action {
  Middleware<S>? get middleware;
}
