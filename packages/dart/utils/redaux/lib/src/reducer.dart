import 'action.dart';
import 'state.dart';

abstract class Reducer<S extends RootState> {
  S call(S state, SyncAction<S> action);
}
