import 'package:run_dart_code_in_pubsub_message/utils/json_utils.dart';
import 'package:test/test.dart';

void main() {
  const testJson = {
    //...
    "application_id": "alsdkflaksdf",
    "token": "qoweuropqweurio",
    "data": {
      "type": 1,
      "name": "run",
      "options": [
        {"value": "3 + 4", "type": 3, "name": "code"}
      ],
      "id": "940033460431622165"
    }
  };

  test('extractInfo() correctly parses json', () async {
    var info = extractMessageCommandInfo(testJson);
    print(info);
    expect(info['application_id'], 'alsdkflaksdf');
    expect(info['token'], 'qoweuropqweurio');
    expect(info['content'], '3 + 4');
  });
}
