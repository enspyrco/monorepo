import 'dart:async';

import 'package:redfire/redux/redfire_middleware.dart';
import 'package:redfire/redux/redfire_reducers.dart';
import 'package:redfire/redux/store_operation.dart';
import 'package:redfire/types/red_fire_state.dart';
import 'package:redux/redux.dart';

/// Services can be injected, or if missing are given default values
class ReduxBundle<T extends RedFireState> {
  /// Takes a list of [Reducer] and create a single reducer that applues all
  /// reducers in the list, using a [List.fold].
  ReduxBundle(List<Reducer<T>> reducers, List<Middleware<T>> middlewares)
      : _reducers = reducers,
        _middlewares = middlewares;

  final List<Reducer<T>> _reducers;
  final List<Middleware<T>> _middlewares;

  static var _bucketName = 'gs://crowdleague-profile-pics';
  static var _storeOperations = <StoreOperation>[];

  static void setup(
      {String? bucketName, List<StoreOperation> storeOperations = const []}) {
    _bucketName = bucketName ?? _bucketName;
    _storeOperations = storeOperations;
  }

  Future<Store<T>> createStore(T initialState) async {
    final _store = Store<T>(_combine(_reducers, redfireReducers()),
        initialState: initialState,
        middleware: [...redfireMiddleware(), ..._middlewares]);

    // now that we have a store, run any store operations that were added
    for (final operation in _storeOperations) {
      await operation.runOn(_store);
    }

    return _store;
  }

  Reducer<T> _combine(List<Reducer<T>> list1, List<Reducer<T>> list2) =>
      (state, action) => (list1 + list2).fold(
          state, (previousState, reducer) => reducer(previousState, action));
}
