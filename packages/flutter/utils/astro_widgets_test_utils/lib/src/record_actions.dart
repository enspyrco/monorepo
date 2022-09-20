import 'package:astro/astro.dart';

/// We add a [RecordActions] to [Store.systemChecks] in [WidgetTestHarness]
/// so we can later check that actions were dispatched.
class RecordActions<T extends RootState> extends SystemCheck<T> {
  final List<Action> actions = [];

  @override
  void call(Store<T> store, Action action) async => actions.add(action);
}
