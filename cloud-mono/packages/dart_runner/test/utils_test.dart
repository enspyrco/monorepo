import 'package:dart_runner/utils/json_utils.dart';
import 'package:test/test.dart';

void main() {
  const testJson = {
    "jsonPayload": {
      //...
      "data": {
        "type": 1,
        "name": "run",
        "options": [
          {"value": "3 + 4", "type": 3, "name": "code"}
        ],
        "id": "940033460431622165"
      },
    }
  };

  test('getValue() correctly parses json', () async {
    var value = extractValue(testJson);
    print(value);
    expect(value, '3 + 4');
  });
}
