import 'dart:convert';

import 'package:googleapis/secretmanager/v1.dart';
import 'package:http/http.dart' as http;

/// If [api] is omitted, [client] is used to create one, so [client] must be present.
/// If [api] is present, [client] will be ignored and can be null.
class SecretManagerService {
  SecretManagerService(String gcpProjectId, http.Client? httpClient,
      {SecretManagerApi? api})
      : _gcpProjectId = gcpProjectId {
    _api = api ?? SecretManagerApi(httpClient!);
  }

  final String _gcpProjectId;
  late final SecretManagerApi _api;

  Future<String> requestSecretValue({required String name}) async {
    var secretName = 'projects/$_gcpProjectId/secrets/$name/versions/latest';
    var response = await _api.projects.secrets.versions.access(secretName);
    var secretValue = response.payload!.data!;
    return utf8.decode(base64.decode(secretValue));
  }
}
