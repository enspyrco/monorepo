import 'dart:convert';

import 'package:http/http.dart';
import 'package:test/fake.dart';

import 'fake_response.dart';

class FakeHttpClient extends Fake implements Client {
  final Response _response;

  FakeHttpClient({Response? response})
      : _response = response ?? FakeResponse(statusCode: 200);

  @override
  Future<Response> post(Uri url,
          {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
      Future.value(_response);
}
