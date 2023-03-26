// See googleapis APIRequester: https://github.com/google/googleapis.dart/blob/master/discoveryapis_commons/lib/src/api_requester.dart

import 'dart:convert';

import 'package:api_client_utils/http_status_codes.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

/// A Requester for API clients, allowing HTTP Requests to a given API
/// Make sure to close() when no longer in use.
class ApiRequester {
  final http.Client _httpClient;
  final String _scheme = 'https';
  final String _host;
  final String _basePath;
  final Map<String, String> _requestHeaders;

  ApiRequester(
    this._httpClient,
    this._host,
    this._basePath,
    this._requestHeaders,
  ) {
    // TODO: clean up incoming params
    //   _host:
    //     - no trailing /
    //   _basePath:
    //     - no leading or trailing /
    //   _requestHeaders:
    //     - no illegal headers
  }

  /// Sends a HTTPRequest using [method] to the endpoint described by [path],
  /// with optional [queryParams] and/or [body] included in the request.
  ///
  /// For now it is assumed that all API endpoints respond with json encoded in UTF8.
  Future<Object?> request(String method, String path,
      {String? body, Map<String, List<String>>? queryParams}) async {
    var response = await _request(path, method, body, queryParams ?? {});

    // For APIs that use duplicate error codes and differentiate with extra json
    // we extract json first then pass it into validation so it can potentially
    // be part of an exception.
    Object? json = await _extractJson(response);

    _validateStatusCode(response, json);
    _validateMimeType(response, json);

    _validateJson(json);

    return json;
  }

  // Build and send the request and return the response
  Future<http.StreamedResponse> _request(String requestPath, String method,
      String? body, Map<String, List<String>> queryParams) {
    String path = '$_basePath/$requestPath';

    // We want to add a '?' with the first key/value then '&' (amp) after that
    String? amp = requestPath.contains('?') ? '&' : null;
    for (final entry in queryParams.entries) {
      path = '$path${amp ?? '?'}${entry.key}=${entry.value}';
      amp ??= '&';
    }

    var uri = Uri(scheme: _scheme, host: _host, path: path);

    final request = RequestImpl(method, uri);
    request.headers.addAll(_requestHeaders);

    return _httpClient.send(request);
  }

  // Decode & join json and throw if there were any problems.
  Future<Object?> _extractJson(http.StreamedResponse response) async {
    var stringStream =
        response.stream.transform(const Utf8Decoder(allowMalformed: true));
    var bodyString = await stringStream.join();
    if (bodyString.isEmpty) return null;

    try {
      var jsonResponse = jsonDecode(bodyString);
      return jsonResponse;
    } on FormatException catch (e) {
      throw APIRequestException(null, e.toString());
    }
  }

  // Look for any 'error' key/values in the decoded response and throw if found.
  void _validateJson(Object? jsonResponse) async {
    if (jsonResponse is List && jsonResponse.length == 1) {
      jsonResponse = jsonResponse.first;
    }

    if (jsonResponse is Map && jsonResponse['error'] is Map) {
      var error = jsonResponse['error'] as Map;
      var codeValue = error['code'];
      var message = error['message'] as String?;

      var code =
          codeValue is String ? int.tryParse(codeValue) : codeValue as int?;

      throw APIRequestException(code, message ?? 'none', jsonResponse);
    }
  }

  // For now it is assumed that all API endpoints respond with json so valid means
  // a json MIME type is found. We use the MIME Sniffing Standard found via W3C:
  // https://mimesniff.spec.whatwg.org/#json-mime-type
  void _validateMimeType(http.StreamedResponse response, Object? json) {
    String? contentType = response.headers['content-type'];

    if (contentType == null) {
      throw APIRequestException(
          null, 'The response had no content-type header.');
    }

    var mediaType = MediaType.parse(contentType);
    if (mediaType.mimeType != 'application/json' &&
        mediaType.mimeType != 'text/json' &&
        !mediaType.subtype.endsWith('+json')) {
      throw APIRequestException(
          null, 'Unable to read response with content-type $contentType', json);
    }
  }

  void _validateStatusCode(http.StreamedResponse response, Object? json) {
    var statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400) {
      throw APIRequestException(
        statusCode,
        messageFor[statusCode] ??
            'We do not currently have a message for status code $statusCode, feel free to file an issue!',
        json,
      );
    }
  }

  void close() => _httpClient.close();
}

class APIRequestException {
  final String message;
  final int? status;
  final Object? jsonResponse; // Could be List or Map

  APIRequestException(this.status, this.message, [this.jsonResponse]);

  Object? getJsonValue({required String key}) {
    if (jsonResponse is! Map<String, Object?>) {
      throw 'APIRequestException: attempted to use $key to access the json response as a map, which didn\'t work as the response was $jsonResponse';
    }
    return (jsonResponse as Map<String, Object?>)[key];
  }

  @override
  String toString() =>
      '  status: $status\n  message: $message\n  json: $jsonResponse';
}

// Copied from googleapis.dart
class RequestImpl extends http.BaseRequest {
  final Stream<List<int>> _stream;

  RequestImpl(String method, Uri url, [Stream<List<int>>? stream])
      : _stream = stream ?? const Stream.empty(),
        super(method, url);

  @override
  http.ByteStream finalize() {
    super.finalize();
    return http.ByteStream(_stream);
  }
}
