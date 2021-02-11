import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/problems/remove_problem.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/problem_page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/reducers/problems/remove_problem.dart';

void main() {
  group('RemoveProblemReducer', () {
    final problem = Problem(errorString: 'Problem error message');
    final problemPageData = ProblemPageData(problem: problem);
    test(
        'removes Problem from appState.problems and ProblemPageData from appState.pagesData',
        () {
      final appState = AppState.init().rebuild(
          (b) => b..pagesData.add(problemPageData)..problems.add(problem));

      expect(appState.problems.length, 1);
      expect(appState.pagesData.length, 2);

      // Invoke the reducer to rebuild AppState.
      final AppState newState = RemoveProblemReducer()
          .reducer(appState, RemoveProblem(problem: problem));

      expect(newState.problems.length, 0);
      expect(newState.pagesData.length, 1);
    });
  });
}
