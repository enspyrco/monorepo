import 'package:flutter_test/flutter_test.dart';
import 'package:redfire/src/navigation/models/problem_page_data.dart';
import 'package:redfire/src/problems/actions/add_problem_action.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/reducers/add_problem_reducer.dart';
import 'package:redfire_test/redfire_test.dart';

void main() {
  group('AddProblemReducer', () {
    test(
        'adds Problem to appState.problems and ProblemPageData to appState.pagesData',
        () {
      final initialState = ExampleAppState.init();

      expect(initialState.problems.length, 0);
      expect(initialState.pages.length, 1);

      final reducer = AddProblemReducer();
      final problem = ProblemInfo('Problem error message');

      // Invokes the reducer to rebuild appState.
      final newState = reducer.reducer(initialState, AddProblemAction(problem));

      expect(newState.problems.first.message, problem.message);
      expect(newState.pages.length, 2);
      expect((newState.pages[1] as ProblemPageData).problem.message,
          problem.message);
    });
  });
}
