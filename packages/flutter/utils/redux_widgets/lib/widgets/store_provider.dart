import 'package:enspyr_redux/redux.dart';
import 'package:flutter/widgets.dart';

import '../errors/store_provider_not_found_error.dart';

class StoreProvider<S extends ReduxState> extends InheritedWidget {
  final ReduxStore<S> _store;

  const StoreProvider({
    Key? key,
    required ReduxStore<S> store,
    required Widget child,
  })  : _store = store,
        super(key: key, child: child);

  static ReduxStore<S> of<S extends ReduxState>(BuildContext context,
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
