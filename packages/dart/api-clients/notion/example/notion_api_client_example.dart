import 'package:notion_api_client/notion_api_client.dart';

import 'credentials.dart';

void main() async {
  var client = NotionClient(token: token);

  var json = await client.retrievePageProperties(
      id: 'e93dda7fa5ed4e28ba27e857cd1f6757');

  print(json);
}
