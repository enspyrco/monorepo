import 'package:dart_runner/evaluate.dart';
import 'package:test/test.dart';

void main() {
  test('Evaluate evaluate()', () async {
    dynamic result = await evaluate('1');
    print(result);
    expect(result, 5.0);
  });
}
