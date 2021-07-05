import 'package:redux/redux.dart';

import '../../../types.dart';

extension ReducersListExtension<T extends RedFireState> on List<Reducer<T>> {
  /// Takes a list of [Reducer] and create a single reducer that applies all
  /// reducers in the list, using a [List.fold].
  Reducer<T> combine() => (state, action) =>
      fold(state, (previousState, reducer) => reducer(previousState, action));
}
