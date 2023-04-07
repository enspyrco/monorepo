import 'package:run_dart_code_in_pubsub_message/evaluate.dart';
import 'package:test/test.dart';

void main() {
  test('Evaluate evaluate()', () async {
    dynamic result = await evaluate(['1']);
    print(result);
    expect(result, 5.0);
  }, skip: true);
}
