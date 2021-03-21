import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/problems/remove_problem_action.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/reducers/problems/remove_problem.dart';

void main() {
  group('RemoveProblemReducer', () {
    final problem =
        Problem(errorString: 'Problem error message', traceString: null);
    final problemPageData = ProblemPageData(problem);
    test(
        'removes Problem from state.problems and ProblemPageData from state.pagesData',
        () {
      final state = AppState.init();
      final updatedState = state.copyWith(
          pagesData: state.pagesData.add(problemPageData),
          problems: state.problems.add(problem));

      expect(updatedState.problems.length, 1);
      expect(updatedState.pagesData.length, 2);

      // Invoke the reducer to rebuild AppState.
      final reducedState = RemoveProblemReducer()
          .reducer(updatedState, RemoveProblemAction(problem: problem));

      expect(reducedState.problems.length, 0);
      expect(reducedState.pagesData.length, 1);
    });
  });
}
