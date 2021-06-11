import 'package:redux/redux.dart';

typedef Operation<T> = Future<void> Function(Store<T> store);

/// An object that can be created with an arbitrary function and will run the
/// function on a given [Store].
///
/// [StoreOperation] objects can be added to the [ReduxBundle] class and will
/// be used by any [ReduxBundle] object when [createStore()] is called
class StoreOperation<T> {
  final Operation<T> _operation;

  StoreOperation(Operation<T> operation) : _operation = operation;

  Future<void> runOn(Store<T> store) => _operation(store);
}
