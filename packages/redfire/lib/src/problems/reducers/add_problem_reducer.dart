import 'package:redux/redux.dart';

import '../../../actions.dart';
import '../../../types.dart';

class AddProblemReducer<T extends RedFireState>
    extends TypedReducer<T, AddProblemAction> {
  AddProblemReducer()
      : super(
          (state, action) => (state as dynamic).copyWith(
              problems: state.problems.add(action.info),
              pages: state.pages.add(ProblemPageData(action.info))) as T,
        );
}
