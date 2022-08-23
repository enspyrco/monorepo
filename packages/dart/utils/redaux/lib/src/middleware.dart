import 'action.dart';
import 'state.dart';
import 'store.dart';

abstract class Middleware<S extends State> {
  void call(Store<S> store, AsyncAction<S> action);
}
