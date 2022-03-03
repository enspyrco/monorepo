import 'package:redfire/src/problems/actions/add_problem_action.dart';
import 'package:redfire/src/problems/models/problem_info.dart';
import 'package:redfire/src/problems/reducers/add_problem_reducer.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('AddProblemReducer', () {
    test('adds to the list', () {
      final initialState = ExampleAppState.init();
      expect(initialState.problems, <ProblemInfo>[]);

      final reducer = AddProblemReducer();
      final newState = reducer.reducer(
          initialState, AddProblemAction(ProblemInfo('m', 'trace')));

      expect(newState.problems.length, 1);
      final problem = newState.problems.first;
      expect(problem.message, 'm');
      expect(problem.trace, 'trace');
    });
  });
}
