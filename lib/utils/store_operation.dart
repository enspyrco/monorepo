import 'package:redux/redux.dart';
import 'package:the_process/models/app_state/app_state.dart';

typedef Operation = Future<void> Function(Store<AppState> store);

/// An object that can be created with an arbitrary function and will run the
/// function on a given [Store].
///
/// [StoreOperation] objects can be added to the [ReduxBundle] class and will
/// be used by any [ReduxBundle] object when [createStore()] is called
class StoreOperation {
  final Operation _operation;

  StoreOperation(Operation operation) : _operation = operation;

  Future<void> runOn(Store<AppState> store) => _operation(store);
}
