import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  const liverServer = 'https://dart-runner-womydx3jxq-uc.a.run.app/';
  const localServer = 'http://0.0.0.0:8080/';

  // Test that the server ACKs a PING
  test('make a POST request to local server', () async {
    final response = await post(Uri.parse(localServer), body: '{"type": 1}');
    expect(response.statusCode, 200);
  });

  // Test that the server ACKs a PING
  test('make a POST request to live server', () async {
    final response = await post(Uri.parse(liverServer), body: '{"type": 1}');
    expect(response.statusCode, 200);
  });
}
