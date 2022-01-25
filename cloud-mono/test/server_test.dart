import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final port = '8080';
  final host = 'http://0.0.0.0:$port';

  test('make a POST request', () async {
    final response = await post(Uri.parse(host + '/'),
        body: '{"pageId" : "8da7e92d9c4947db9d0ba0e39437b33e"}');
    expect(response.statusCode, 200);
  });
}


// {"object":"list","results":[{"object":"block","id":"2caa5c3d-497f-418e-8f2d-4b82ef0352e9","created_time":"2021-08-03T02:25:00.000Z","last_edited_time":"2021-08-03T02:25:00.000Z","has_children":false,"archived":false,"type":"paragraph","paragraph":{"text":[]}},{"object":"block","id":"c9cb1bdf-54a6-4419-95d5-7c787f35a945","created_time":"2021-08-03T02:25:00.000Z","last_edited_time":"2022-01-13T01:35:00.000Z","has_children":true,"archived":false,"type":"child_page","child_page":{"title":"How-tos"}},{"object":"block","id":"86cac92e-ea4b-41ec-b450-fb465014f8e5","created_time":"2021-08-03T02:25:00.000Z","last_edited_time":"2021-08-22T10:21:00.000Z","has_children":true,"archived":false,"type":"child_page","child_page":{"title":"Explainers"}},{"object":"block","id":"54df5f4b-db08-4ed4-8300-20e20f647ef9","created_time":"2021-08-03T02:25:00.000Z","last_edited_time":"2021-08-03T02:25:00.000Z","has_children":true,"archived":false,"type":"child_page","child_page":{"title":"Medium"}},{"object":"block","id":"3aa6bdde-4aad-49b6-a4e1-979065891eff","created_time":"2021-08-03T02:25:00.000Z","last_edited_time":"2021-08-03T02:25:00.000Z","has_children":true,"archived":false,"type":"child_page","child_page":{"title":"Start, Now"}}],"next_cursor":null,"has_more":false}