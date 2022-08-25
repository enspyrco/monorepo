import 'middleware.dart';
import 'reducer.dart';
import 'state.dart';

class Action {
  final List<AsyncAction> history = [];
}

abstract class SyncAction<S extends RootState> extends Action {
  Reducer<S> get reducer;
}

abstract class AsyncAction<S extends RootState> extends Action {
  Middleware<S> get middleware;
}
