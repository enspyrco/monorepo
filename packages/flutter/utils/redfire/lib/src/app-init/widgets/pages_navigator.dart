import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../navigation/extensions/page_data_list_extension.dart';
import '../../navigation/models/page_data.dart';
import '../../types/red_fire_state.dart';

/// A [StoreConnector] updates the [Navigator] whenever the [AppState]'s
/// [pages] section changes.
class PagesNavigator<T extends RedFireState> extends StatelessWidget {
  const PagesNavigator(
    this._store, {
    Key? key,
  }) : super(key: key);

  final Store<RedFireState> _store;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<T, IList<PageData>>(
      distinct: true,
      converter: (store) => store.state.pages,
      builder: (context, pages) => Navigator(
        pages: pages.toPages<T>(),
        onPopPage: (route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          }

          if (route.isCurrent) {
            _store.dispatch(const RemoveCurrentPageAction());
          }

          return true;
        },
      ),
    );
  }
}
