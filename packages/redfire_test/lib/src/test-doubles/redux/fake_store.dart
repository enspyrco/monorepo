import 'dart:async';

import 'package:redfire/types.dart';
import 'package:redux/redux.dart';

import 'empty_reducer.dart';

/// An extension of [Store] with no reducers that takes a [state] of type
/// "T extends RedFireState".
///
/// [state] can be externally updated so that the store emits the updated state.
///
/// [FakeStore] also keeps a record of dispatched actions that can be queried.
class FakeStore<T extends RedFireState> implements Store<T> {
  FakeStore(T state)
      : _state = state,
        _changeController = StreamController<T>.broadcast(),
        reducer = EmptyReducer<T>();

  /// TODO: figure out how to create a T and update with auth info
  // // Named constructor for creating an authenticated fake store that will
  // // allow tests to bypass the auth UI
  // FakeStore.authenticated()
  //     : _state = ExampleAppState.init().copyWith.auth(
  //           userData: AuthUserDataExamples.minimal,
  //           step: AuthenticationEnum.waitingForInput),
  //       _changeController = StreamController<T>.broadcast(),
  //       reducer = EmptyReducer();

  // The list of dispatched actions that can be queried by a test.
  final _dispatched = <ReduxAction>[];
  List<ReduxAction> get dispatched => List.unmodifiable(_dispatched);

  // A controller & stream for emiting each disptached action so tests can listen in.
  final _dispatchesStreamController = StreamController<ReduxAction>();
  Stream<ReduxAction> get dispatches => _dispatchesStreamController.stream;

  // A list of actions that make the dispatch function throw. When encountered
  // the action is removed from the list, meaning only the first attempted
  // dispatch will throw, unless the action is re-added after the dispatch.
  final _throwList = <ReduxAction>[];
  void throwOn(ReduxAction action) => _throwList.add(action);

  //
  void updateState(T state) {
    _state = state;
    _changeController.add(_state);
  }

  // We must override the reducer as a var in order to extend Store.
  @override
  T Function(T, dynamic) reducer;

  // We keep our own state so we can have a default value.
  T _state;

  // We need a StreamController to provide the onChange method.
  final StreamController<T> _changeController;

  // Override dispatch to just add the action to the list.
  @override
  dynamic dispatch(dynamic action) {
    if (action is! ReduxAction) throw Exception('action != ReduxAction');
    if (_throwList.contains(action)) {
      _throwList.remove(action); // don't leave FakeStore in a 'broken' state
      throw Exception('Encountered $action');
    }
    _dispatched.add(action);
    _dispatchesStreamController.add(action);
  }

  @override
  Stream<T> get onChange => _changeController.stream;

  @override
  T get state => _state;

  @override
  Future teardown() => _changeController.close();
}
