import 'package:api_client_utils/api_client_utils.dart';
import 'package:api_client_utils/types.dart';
import 'package:http/http.dart' as http;
import 'package:notion_api_client/src/pageable.dart';
import 'package:notion_api_client/src/state/pages/page_object.dart';

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
  Future<PageObject> getPageProperties({required String id}) async {
    var json = await _requester.request('GET', 'pages/$id');
    return PageObject.fromJson(json as JsonMap);
  }

  Future<PageableResponse?> getBlockChildren({required String id}) async {
    var json = await _requester.request('GET', 'blocks/$id/children');
    var response = PageableResponse.fromJson(json as JsonMap);
    return response;
  }

  Future<Object?> getPageContent({required String id}) async {
    var json = await _requester.request('GET', 'pages/$id');
    return json;
  }

  void close() => _client.close();
}

// Paginated endpoints
// - Query a database
// - List databases
// - Retrieve a page property item
// - Retrieve block children
// - List all users
// - Search