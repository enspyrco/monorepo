import 'package:flutter/widgets.dart';
import 'package:redaux/redaux.dart' as redaux;

import '../errors/store_provider_not_found_error.dart';

class StoreProvider<S extends redaux.State> extends InheritedWidget {
  final redaux.Store<S> _store;

  const StoreProvider({
    Key? key,
    required redaux.Store<S> store,
    required Widget child,
  })  : _store = store,
        super(key: key, child: child);

  static redaux.Store<S> of<S extends redaux.State>(BuildContext context,
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
