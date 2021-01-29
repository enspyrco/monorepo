import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/actions/problems/add_problem.dart';
import 'package:the_process/models/app_state/app_state.dart';
import 'package:the_process/models/navigation/page_data/problem_page_data.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/reducers/problems/add_problem.dart';

void main() {
  group('AddProblemReducer', () {
    test(
        'Adds Problem to appState.problems and ProblemPageData to appState.pagesData',
        () {
      final initialState = AppState.init();

      expect(initialState.problems.length, 0);
      expect(initialState.pagesData.length, 1);

      final reducer = AddProblemReducer();
      final problem = Problem(
        errorString: 'Problem error message',
        traceString: StackTrace.current.toString(),
      );

      // Invokes the reducer to rebuild appState.
      final newState = reducer.reducer(
          initialState, AddProblem(errorString: problem.errorString));

      expect(newState.problems.first.errorString, problem.errorString);
      expect(newState.pagesData.length, 2);
      expect((newState.pagesData[1] as ProblemPageData).problem.errorString,
          problem.errorString);
    });
  });
}
