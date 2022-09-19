import 'package:json_types/json_types.dart';

import '../redaux.dart';

abstract class Action {
  AsyncAction? parent;
  JsonMap toJson({int? parentId});
}

abstract class SyncAction<S extends RootState> extends Action {
  S land(S state);
}

abstract class AsyncAction<S extends RootState> extends Action {
  Future<void> launch(Store<S> store);
}
