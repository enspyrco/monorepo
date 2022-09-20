import 'package:notion_api_client/notion_api_client.dart';

import 'credentials.dart';

void main() async {
  var client = NotionClient(token: token);

  // var page = await client.retrievePageProperties(id: 'e93dda7fa5ed4e28ba27e857cd1f6757');

  var response =
      await client.getBlockChildren(id: 'e93dda7fa5ed4e28ba27e857cd1f6757');

  client.close();

  print(response);
}
