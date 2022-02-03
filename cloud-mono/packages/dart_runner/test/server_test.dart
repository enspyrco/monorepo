import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  test('make a POST request', () async {
    final response =
        await post(Uri.parse('http://0.0.0.0:8080/'), body: '{"type": 1}');
    expect(response.statusCode, 200);
  });
}
