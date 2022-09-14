import 'package:redaux/redaux.dart';

/// We add a [RecordActionsEndware] to [Store.endwares] in [WidgetTestHarness]
/// so we can later check that actions were dispatched.
class RecordActionsEndware<T extends RootState> extends Endware<T> {
  final List<Action> actions = [];

  @override
  void call(Store<T> store, Action action) async => actions.add(action);
}
