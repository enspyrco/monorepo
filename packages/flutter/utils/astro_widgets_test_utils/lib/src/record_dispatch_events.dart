import 'package:astro/astro.dart';

class RecordDispatchEvents<T extends RootState> extends SystemCheck<T> {
  final List<DispatchEvent> events = [];
  final Map<Action, T> stateForAction = {};

  @override
  void call(Store<T> store, Action action) async {
    events.add(DispatchEvent(action, store.state));
    stateForAction[action] = store.state;
  }

  bool includes(Action action) => stateForAction[action] != null;
}
