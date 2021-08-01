import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/problems/actions/remove_problem_action.dart';
import 'package:redfire/src/problems/reducers/remove_problem_reducer.dart';
import 'package:redfire/types.dart';

import '../../test-doubles/app_state/app_state.dart';

void main() {
  group('RemoveProblemReducer', () {
    final problem = ProblemInfo('Problem error message');
    final problemPageData = ProblemPageData(problem);
    test(
        'removes Problem from state.problems and ProblemPageData from state.pagesData',
        () {
      final state = AppState.init();
      final updatedState = state.copyWith(
          pages: state.pages.add(problemPageData),
          problems: state.problems.add(problem));

      expect(updatedState.problems.length, 1);
      expect(updatedState.pages.length, 2);

      // Invoke the reducer to rebuild AppState.
      final reducedState = RemoveProblemReducer()
          .reducer(updatedState, RemoveProblemAction(problem));

      expect(reducedState.problems.length, 0);
      expect(reducedState.pages.length, 1);
    });
  });
}
