import 'dart:convert';

import 'package:run_dart_code_in_pubsub_message/typedefs.dart';
import 'package:run_dart_code_in_pubsub_message/utils/json_utils.dart';
import 'package:test/test.dart';

// import 'data/signature_test_data.dart' as old_test_data;
import 'data/message_test_data.dart' as test_data;

void main() {
  //
  test('In invalid Discord message gets caught', () {
    final bodyJson =
        jsonDecode(test_data.invalidMessageWithJustText)['jsonPayload'];
    // final bodyJson = old_test_data.body;

    JsonMap info = extractMessageCommandInfo(bodyJson);

    expect(info['application_id'], '938746298146885634');
    expect(info['token'], 'fakeToken0');
    expect(
        info['content'],
        'A Flutter app for presentations (something like Google Slides/Powerpoint/Keynote) with:\n'
        '- a web app that everyone \'warches\'\n'
        '-  the presenter moves through the slides\n'
        '- there is also mobile apps for voting / answering questions \n'
        '- slides with a question shows stats for answers as they come in\n'
        '- stretch goal: extend the question/answers feature to include solving coding challenges');
  });

  test('The "value" is extracted correctly from a valid Discord message ', () {
    final bodyJson =
        jsonDecode(test_data.validMessageWithValidDart)['jsonPayload'];

    JsonMap info = extractMessageCommandInfo(bodyJson);

    // The expected values are from the test data, which was a real message extracted from the server logs
    expect(info['application_id'], '938746298146885634');
    expect(info['token'], 'fakeToken1');
    expect(
        info['content'],
        '```Dart\n'
        'int i = 10;\n'
        'int j = 20;\n'
        'return i*j;\n'
        '```');
  });
}
