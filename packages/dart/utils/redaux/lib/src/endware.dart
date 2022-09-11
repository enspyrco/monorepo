import 'action.dart';
import 'state.dart';
import 'store.dart';

/// Endware in redaux are like Middleware in redux - each endware is called on
/// every dispatched action. However, Endwares are always called after the action's
/// reducer or middleware have been called, hence the 'end' in endware.
///
/// When multiple endware are added to the Store, they are called in the order
/// they were added to the endwares list.
///
/// The redaux library is an attempt to make action dispatch easier to reason
/// about by restricting the relationship b/w actions and middleware/reducers to
/// a 1:1 relationship but there may be times (eg. during testing & development)
/// where being able to run logic on every dispatch is advantageous.
abstract class Endware<S extends RootState> {
  const Endware();
  void call(Store<S> store, Action action);
}
