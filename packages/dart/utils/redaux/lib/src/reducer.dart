import 'action.dart';
import 'state.dart';

abstract class Reducer<S extends State> {
  S call(S state, SyncAction<S> action);
}
