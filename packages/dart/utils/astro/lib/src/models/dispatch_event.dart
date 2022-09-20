import '../../astro.dart';

class DispatchEvent<T extends RootState> {
  DispatchEvent(this.action, this.state);
  final Action action;
  final T state;
}
