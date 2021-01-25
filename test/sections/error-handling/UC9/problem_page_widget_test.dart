import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_process/models/problems/problem.dart';
import 'package:the_process/widgets/shared/problem_page.dart';

void main() {
  group('ProblemPage', () {
    testWidgets('shows expected message', (WidgetTester tester) async {
      final problem = Problem(
        errorString: 'Problem error message',
        traceString: StackTrace.current.toString(),
      );
      final problemPage = MaterialApp(home: ProblemPage(problem));

      await tester.pumpWidget(problemPage);

      final problemText = find.text(problem.errorString);

      expect(problemText, findsOneWidget);
    });
  });
}
