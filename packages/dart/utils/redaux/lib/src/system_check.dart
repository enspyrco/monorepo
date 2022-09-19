import 'action.dart';
import 'state.dart';
import 'store.dart';

/// The redaux library is an attempt to make action dispatch easier to reason
/// about by restricting the relationship b/w actions and launch/land functions to
/// a 1:1 relationship but there may be times (eg. during testing & development)
/// where being able to run logic on every dispatch is advantageous.
///
/// SystemChecks in redaux are are called for every action:
/// - before launch for async actions
/// - after landing for sync actions
///
/// The reason is that ‘launch’ essentially means ‘call an async function’ so
/// we don’t know when the launch will return but we want to be able to do things
/// at the time of launch, so we run the SystemCheck before.
///
/// On the other hand, we always want to know what the new state is *after* a
/// sync action has landed so that is when the SystemCheck runs.
///
/// When multiple system checks are added to the Store, they are called in the order
/// they were added to the systemChecks list.
abstract class SystemCheck<S extends RootState> {
  const SystemCheck();
  void call(Store<S> store, Action action);
}
