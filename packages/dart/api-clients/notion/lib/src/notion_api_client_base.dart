import 'package:api_client_utils/api_client_utils.dart';
import 'package:http/http.dart' as http;

class NotionClient {
  static const _host = 'api.notion.com';
  static const _basePath = 'v1';
  final http.Client _client;
  late final ApiRequester _requester;

  NotionClient({http.Client? client, required String token})
      : _client = client ?? http.Client() {
    _requester = ApiRequester(_client, _host, _basePath,
        {'Authorization': 'Bearer $token', 'Notion-Version': '2022-02-22'});
  }

  /// "GET" or "POST", "HEAD", "PUT", or "DELETE"
  Future<Object?> retrievePageProperties({required String id}) async {
    var json = await _requester.request('GET', 'pages/$id');
    return json;
  }

  Future<Object?> retrievePageContent({required String id}) async {
    var json = await _requester.request('GET', 'pages/$id');
    return json;
  }

  void close() => _client.close();
}
