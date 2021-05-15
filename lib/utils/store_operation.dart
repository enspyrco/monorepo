import 'package:redux/redux.dart';

typedef Operation = Future<void> Function(Store store);

/// An object that can be created with an arbitrary function and will run the
/// function on a given [Store].
///
/// [StoreOperation] objects can be added to the [ReduxBundle] class and will
/// be used by any [ReduxBundle] object when [createStore()] is called
class StoreOperation {
  final Operation _operation;

  StoreOperation(Operation operation) : _operation = operation;

  Future<void> runOn(Store store) => _operation(store);
}
