import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/type_utils.dart';

class HttpService {
  static const _queryParameters = {
    'sort': 'new',
    'limit': '100',
    'raw_json': '1'
  };
  final _uri =
      Uri.https('www.reddit.com', '/r/FlutterDev/.json', _queryParameters);

  Future<JsonList> retrieveRedditPosts() async {
    final response =
        await http.get(_uri, headers: {'content-type': 'application/json'});

    // Decode the response to a JsonMap and take out the list of reddit posts.
    final json = JsonDecoder().convert(response.body);
    return json['data']['children'] as JsonList;
  }
}
