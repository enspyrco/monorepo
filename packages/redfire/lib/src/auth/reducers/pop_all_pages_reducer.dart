import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redux/redux.dart';

import '../../../types.dart';
import '../../navigation/actions/pop_all_pages_action.dart';
import '../../types/red_fire_state.dart';

class PopAllPagesReducer<T extends RedFireState>
    extends TypedReducer<T, PopAllPagesAction> {
  PopAllPagesReducer()
      : super((state, action) {
          try {
            state = (state as dynamic).copyWith(pages: [state.pages.first].lock)
                as T; // lock
          } catch (error, trace) {
            var problem = ProblemInfo('$error', '$trace');
            var newProblems = state.problems.add(problem);
            var newPages = state.pages.add(ProblemPageData(problem));
            state = (state as dynamic)
                .copyWith(problems: newProblems, pages: newPages) as T;
          }
          return state;
        });
}
