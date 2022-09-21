import 'package:astro/astro.dart' as astro;
import 'package:flutter/widgets.dart';

import '../errors/store_provider_not_found_error.dart';

class StoreProvider<S extends astro.RootState> extends InheritedWidget {
  final astro.MissionControl<S> _store;

  const StoreProvider({
    Key? key,
    required astro.MissionControl<S> store,
    required Widget child,
  })  : _store = store,
        super(key: key, child: child);

  static astro.MissionControl<S> of<S extends astro.RootState>(
      BuildContext context,
      {bool listen = true}) {
    final provider = (listen
        ? context.dependOnInheritedWidgetOfExactType<StoreProvider<S>>()
        : context
            .getElementForInheritedWidgetOfExactType<StoreProvider<S>>()
            ?.widget) as StoreProvider<S>?;

    if (provider == null) throw StoreProviderNotFoundError<S>();

    return provider._store;
  }

  @override
  bool updateShouldNotify(StoreProvider<S> oldWidget) =>
      _store != oldWidget._store;
}
