import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final local = 'http://0.0.0.0:8080';
  final live = '';

  test('Echo', () async {
    final response = await get(Uri.parse(local + '/echo/hello'));
    expect(response.statusCode, 200);
    expect(response.body, 'hello\n');
  });
}
