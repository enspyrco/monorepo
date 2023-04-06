import 'package:run_dart_code_in_pubsub_message/interaction_data.dart';
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
    final InteractionData data = extractMessageCommandInfo(testJson);
    print(data);
    expect(data.applicationId, 'alsdkflaksdf');
    expect(data.token, 'qoweuropqweurio');
    expect(data.token, '3 + 4');
  });
}
