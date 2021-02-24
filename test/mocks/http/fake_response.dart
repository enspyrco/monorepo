import 'package:http/http.dart';
import 'package:test/fake.dart';

class FakeResponse extends Fake implements Response {
  final int _statusCode;
  final String? _reasonPhrase;

  FakeResponse({required int statusCode, String? reasonPhrase})
      : _statusCode = statusCode,
        _reasonPhrase = reasonPhrase;

  @override
  String? get reasonPhrase => _reasonPhrase;

  @override
  int get statusCode => _statusCode;
}
