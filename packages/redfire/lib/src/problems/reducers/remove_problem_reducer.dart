import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../../types.dart';
import '../../navigation/models/problem_page_data.dart';

class RemoveProblemReducer<T extends RedFireState>
    extends TypedReducer<T, RemoveProblemAction> {
  RemoveProblemReducer()
      : super((state, action) => (state as dynamic).copyWith(
            problems: state.problems.remove(action.info),
            pages: state.pages.remove(ProblemPageData(action.info))) as T);
}
