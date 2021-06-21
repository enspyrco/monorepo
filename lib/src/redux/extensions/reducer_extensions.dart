import 'package:redux/redux.dart';

extension ReducersExtension on List<Reducer> {
  Reducer combineWith(List<ReducerClass> reducers) =>
      (state, action) => (this + List<Reducer<dynamic>>.from(reducers)).fold(
          state, (previousState, reducer) => reducer(previousState, action));
}
