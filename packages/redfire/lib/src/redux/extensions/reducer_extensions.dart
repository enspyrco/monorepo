import 'package:redfire/src/types/red_fire_state.dart';
import 'package:redux/redux.dart';

extension ReducersExtension<T extends RedFireState> on List<Reducer<T>> {
  Reducer<T> combineWith(List<ReducerClass> reducers) =>
      (state, dynamic action) => (this + List<Reducer<T>>.from(reducers)).fold(
          state, (previousState, reducer) => reducer(previousState, action));
}
