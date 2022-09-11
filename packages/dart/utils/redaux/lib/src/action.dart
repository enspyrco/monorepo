import 'package:json_types/json_types.dart';

import 'middleware.dart';
import 'reducer.dart';
import 'state.dart';

abstract class Action {
  AsyncAction? parent;
  JsonMap toJson({int? parentId});
}

abstract class SyncAction<S extends RootState> extends Action {
  Reducer<S> get reducer;
}

abstract class AsyncAction<S extends RootState> extends Action {
  Middleware<S> get middleware;
}
