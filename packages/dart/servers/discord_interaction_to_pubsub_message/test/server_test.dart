import 'dart:convert';

import 'package:http/http.dart';
import 'package:test/test.dart';

import 'data/signature_test_data.dart';

const liverServer = 'https://dart-runner-womydx3jxq-uc.a.run.app/';
const localServer = 'http://0.0.0.0:8080/';

void main() {
  // Test that the server ACKs a PING
  test('make a POST request to local server', () async {
    final response = await post(Uri.parse(localServer), body: '{"type": 1}');
    expect(response.statusCode, 200);
  }, skip: true);

  // Test that the server ACKs a PING
  test('make a POST request to live server', () async {
    final response = await post(Uri.parse(liverServer), body: '{"type": 1}');
    expect(response.statusCode, 200);
  }, skip: true);

  // Test the server with typical json and headers
  // TODO: not sure why validation fails - the body taken from the logs has been decoded perhaps?
  test('make a POST request to local server with typical json', () async {
    final response = await post(Uri.parse(localServer),
        body: jsonEncode(body),
        headers: {
          'X-Signature-Ed25519': signature,
          'X-Signature-Timestamp': timestamp
        });
    expect(response.statusCode, 200);
  }, skip: true);
}
